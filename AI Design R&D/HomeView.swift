//
//  HomeView.swift
//  AI Design R&D
//
//  Created by Great Codack's Macbook on 4/18/25.
//

import SwiftUI

struct HomeView: View {
    let primaryColor: Color
    
    // Sample data for the home screen
    let featuredItems = [
        "AI Design Tools", "Machine Learning Models", "Neural Networks", 
        "Computer Vision", "Natural Language Processing"
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Hero section
                    ZStack(alignment: .bottomLeading) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [primaryColor, primaryColor.opacity(0.7)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(height: 200)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("AI Design R&D")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Explore the future of AI design")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                    
                    // Featured section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Featured")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(featuredItems, id: \.self) { item in
                                    VStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(width: 150, height: 100)
                                            .overlay(
                                                Image(systemName: "sparkles")
                                                    .font(.largeTitle)
                                                    .foregroundColor(primaryColor)
                                            )
                                        
                                        Text(item)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                            .lineLimit(2)
                                            .frame(width: 150)
                                    }
                                    .padding(.bottom, 5)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Recent activity section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recent Activity")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ForEach(1...3, id: \.self) { item in
                            HStack(spacing: 15) {
                                Circle()
                                    .fill(primaryColor.opacity(0.2))
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Image(systemName: "bell.fill")
                                            .foregroundColor(primaryColor)
                                    )
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Activity \(item)")
                                        .font(.headline)
                                    
                                    Text("Recent update on your AI design project")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("Now")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationBarTitle("Home", displayMode: .large)
            .navigationBarItems(
                trailing: Button(action: {}) {
                    Image(systemName: "bell")
                        .foregroundColor(primaryColor)
                }
            )
        }
    }
}

#Preview {
    HomeView(primaryColor: Color(red: 0.2, green: 0.5, blue: 0.9))
}
