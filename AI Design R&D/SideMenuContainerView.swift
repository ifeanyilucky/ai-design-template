//
//  SideMenuContainerView.swift
//  AI Design R&D
//
//  Created by Augment Agent on 4/18/25.
//

import SwiftUI

struct SideMenuContainerView<Content: View>: View {
    @Binding var isMenuShowing: Bool
    let content: Content
    let primaryColor: Color
    let secondaryColor: Color
    var menuWidth: CGFloat = UIScreen.main.bounds.width * 0.8
    
    init(isMenuShowing: Binding<Bool>, primaryColor: Color, secondaryColor: Color, @ViewBuilder content: () -> Content) {
        self._isMenuShowing = isMenuShowing
        self.content = content()
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Main content
            content
                .disabled(isMenuShowing)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .offset(x: isMenuShowing ? menuWidth * 0.6 : 0)
                .animation(.spring(), value: isMenuShowing)
                .overlay(
                    Group {
                        if isMenuShowing {
                            Color.black
                                .opacity(0.5)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        isMenuShowing = false
                                    }
                                }
                        }
                    }
                )
            
            // Side menu
            if isMenuShowing {
                SideMenuView(
                    primaryColor: primaryColor,
                    secondaryColor: secondaryColor,
                    isShowing: $isMenuShowing,
                    onMenuItemTap: { menuItem in
                        print("Selected menu item: \(menuItem)")
                    }
                )
                .frame(width: menuWidth)
                .transition(.move(edge: .leading))
                .zIndex(1)
            }
        }
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width > 50 {
                        withAnimation(.spring()) {
                            isMenuShowing = true
                        }
                    } else if gesture.translation.width < -50 {
                        withAnimation(.spring()) {
                            isMenuShowing = false
                        }
                    }
                }
        )
    }
}

#Preview {
    SideMenuContainerView(
        isMenuShowing: .constant(true),
        primaryColor: Color(red: 0.2, green: 0.5, blue: 0.9),
        secondaryColor: Color(red: 0.9, green: 0.3, blue: 0.5)
    ) {
        Text("Main Content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }
}
