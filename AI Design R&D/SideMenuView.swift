//
//  SideMenuView.swift
//  AI Design R&D
//
//  Created by Augment Agent on 4/18/25.
//

import SwiftUI

struct SideMenuView: View {
    let primaryColor: Color
    let secondaryColor: Color
    @Binding var isShowing: Bool
    var onMenuItemTap: (String) -> Void
    
    // Menu items
    let menuItems = [
        (title: "Dashboard", icon: "house.fill"),
        (title: "Projects", icon: "folder.fill"),
        (title: "Analytics", icon: "chart.bar.fill"),
        (title: "Notifications", icon: "bell.fill"),
        (title: "Messages", icon: "message.fill"),
        (title: "Bookmarks", icon: "bookmark.fill"),
        (title: "Documents", icon: "doc.fill"),
        (title: "Settings", icon: "gearshape.fill")
    ]
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            LinearGradient(
                gradient: Gradient(colors: [
                    primaryColor.opacity(0.95),
                    secondaryColor.opacity(0.9)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            // Menu content
            VStack(alignment: .leading, spacing: 0) {
                // Header with user info
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        // User avatar
                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Text("AJ")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                        
                        // User info
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Alex Johnson")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text("AI Design Researcher")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        
                        Spacer()
                        
                        // Close button
                        Button(action: {
                            withAnimation(.spring()) {
                                isShowing = false
                            }
                        }) {
                            Image(systemName: "xmark")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.white.opacity(0.2))
                                .clipShape(Circle())
                        }
                    }
                    
                    // Status
                    HStack(spacing: 4) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 8, height: 8)
                        
                        Text("Online")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50)
                .padding(.bottom, 30)
                
                // Divider
                Rectangle()
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 1)
                    .padding(.horizontal)
                
                // Menu items
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(menuItems, id: \.title) { item in
                            Button(action: {
                                onMenuItemTap(item.title)
                                withAnimation(.spring()) {
                                    isShowing = false
                                }
                            }) {
                                HStack(spacing: 16) {
                                    Image(systemName: item.icon)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 24, height: 24)
                                    
                                    Text(item.title)
                                        .font(.body)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 12)
                                .padding(.horizontal)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white.opacity(0.0))
                                        .padding(.horizontal, 8)
                                )
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.horizontal, 8)
                        }
                    }
                    .padding(.vertical)
                }
                
                Spacer()
                
                // Footer
                VStack(alignment: .leading, spacing: 20) {
                    // Divider
                    Rectangle()
                        .fill(Color.white.opacity(0.2))
                        .frame(height: 1)
                        .padding(.horizontal)
                    
                    // Sign out button
                    Button(action: {
                        // Sign out action
                    }) {
                        HStack(spacing: 16) {
                            Image(systemName: "arrow.right.square.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                            
                            Text("Sign Out")
                                .font(.body)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal, 8)
                    
                    // App version
                    Text("AI Design R&D v1.0.0")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
    }
}

#Preview {
    SideMenuView(
        primaryColor: Color(red: 0.2, green: 0.5, blue: 0.9),
        secondaryColor: Color(red: 0.9, green: 0.3, blue: 0.5),
        isShowing: .constant(true),
        onMenuItemTap: { _ in }
    )
}
