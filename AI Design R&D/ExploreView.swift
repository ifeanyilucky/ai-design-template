//
//  ExploreView.swift
//  AI Design R&D
//
//  Created by Great Codack's Macbook on 4/18/25.
//

import SwiftUI

struct ExploreView: View {
    let secondaryColor: Color
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    
    let categories = ["All", "Design", "Research", "Development", "Testing"]
    
    // Sample explore items
    let exploreItems = [
        (title: "AI Image Generation", description: "Create stunning images with AI", icon: "photo.fill"),
        (title: "Voice Recognition", description: "Advanced voice recognition models", icon: "waveform"),
        (title: "Predictive Analytics", description: "Forecast trends with machine learning", icon: "chart.bar.fill"),
        (title: "Neural Networks", description: "Build and train neural networks", icon: "brain.head.profile"),
        (title: "Computer Vision", description: "Object detection and recognition", icon: "eye.fill"),
        (title: "Natural Language", description: "Process and understand human language", icon: "text.bubble.fill")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $searchText)
                        .foregroundColor(.primary)
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top)
                
                // Categories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(
                                        Capsule()
                                            .fill(selectedCategory == category ? secondaryColor : Color.gray.opacity(0.2))
                                    )
                                    .foregroundColor(selectedCategory == category ? .white : .primary)
                            }
                        }
                    }
                    .padding()
                }
                
                // Main content
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 16),
                        GridItem(.flexible(), spacing: 16)
                    ], spacing: 16) {
                        ForEach(exploreItems, id: \.title) { item in
                            VStack(alignment: .leading, spacing: 10) {
                                // Icon
                                HStack {
                                    Spacer()
                                    Image(systemName: item.icon)
                                        .font(.system(size: 30))
                                        .foregroundColor(secondaryColor)
                                        .frame(width: 60, height: 60)
                                        .background(secondaryColor.opacity(0.2))
                                        .clipShape(Circle())
                                    Spacer()
                                }
                                .padding(.top, 10)
                                
                                // Title and description
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.title)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .lineLimit(1)
                                    
                                    Text(item.description)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .lineLimit(2)
                                }
                                .padding(.horizontal, 12)
                                .padding(.bottom, 12)
                            }
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        }
                    }
                    .padding()
                    .animation(.spring(), value: selectedCategory)
                }
                .background(Color(UIColor.systemGroupedBackground))
            }
            .navigationBarTitle("Explore", displayMode: .large)
            .navigationBarItems(
                trailing: Button(action: {}) {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(secondaryColor)
                }
            )
        }
    }
}

#Preview {
    ExploreView(secondaryColor: Color(red: 0.9, green: 0.3, blue: 0.5))
}
