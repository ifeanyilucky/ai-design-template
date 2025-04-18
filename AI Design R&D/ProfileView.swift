//
//  ProfileView.swift
//  AI Design R&D
//
//  Created by Great Codack's Macbook on 4/18/25.
//

import SwiftUI

struct ProfileView: View {
    let primaryColor: Color
    let secondaryColor: Color
    
    // Sample user data
    let userName = "Alex Johnson"
    let userRole = "AI Design Researcher"
    let userStats = [
        ("Projects", "12"),
        ("Followers", "256"),
        ("Following", "184")
    ]
    
    // Sample projects
    let projects = [
        (name: "Neural Style Transfer", progress: 0.8, color: Color.blue),
        (name: "Voice Recognition Model", progress: 0.6, color: Color.purple),
        (name: "Image Classification", progress: 0.9, color: Color.green),
        (name: "Sentiment Analysis", progress: 0.4, color: Color.orange)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    // Profile header
                    VStack(spacing: 15) {
                        // Profile image
                        ZStack {
                            Circle()
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [primaryColor, secondaryColor]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                                .frame(width: 110, height: 110)
                            
                            Text("AJ")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        // User info
                        VStack(spacing: 5) {
                            Text(userName)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(userRole)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        // User stats
                        HStack(spacing: 30) {
                            ForEach(userStats, id: \.0) { stat in
                                VStack {
                                    Text(stat.1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    
                                    Text(stat.0)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(.top, 5)
                        
                        // Edit profile button
                        Button(action: {}) {
                            Text("Edit Profile")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(primaryColor)
                                .cornerRadius(10)
                        }
                        .padding(.top, 5)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                    
                    // Projects section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Current Projects")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ForEach(projects, id: \.name) { project in
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(project.name)
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    Text("\(Int(project.progress * 100))%")
                                        .font(.subheadline)
                                        .foregroundColor(project.color)
                                }
                                
                                // Progress bar
                                GeometryReader { geometry in
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .frame(width: geometry.size.width, height: 8)
                                            .opacity(0.2)
                                            .foregroundColor(project.color)
                                            .cornerRadius(4)
                                        
                                        Rectangle()
                                            .frame(width: geometry.size.width * project.progress, height: 8)
                                            .foregroundColor(project.color)
                                            .cornerRadius(4)
                                    }
                                }
                                .frame(height: 8)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Achievements section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Achievements")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        HStack(spacing: 15) {
                            ForEach(["trophy.fill", "star.fill", "medal.fill"], id: \.self) { icon in
                                VStack {
                                    Image(systemName: icon)
                                        .font(.system(size: 30))
                                        .foregroundColor(secondaryColor)
                                        .frame(width: 60, height: 60)
                                        .background(secondaryColor.opacity(0.2))
                                        .clipShape(Circle())
                                    
                                    Text(achievementTitle(for: icon))
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 80)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationBarTitle("Profile", displayMode: .large)
            .navigationBarItems(
                trailing: Button(action: {}) {
                    Image(systemName: "gearshape")
                        .foregroundColor(primaryColor)
                }
            )
        }
    }
    
    // Helper function to get achievement titles
    private func achievementTitle(for icon: String) -> String {
        switch icon {
        case "trophy.fill":
            return "Top Researcher"
        case "star.fill":
            return "5 Star Projects"
        case "medal.fill":
            return "Innovation Award"
        default:
            return ""
        }
    }
}

#Preview {
    ProfileView(
        primaryColor: Color(red: 0.2, green: 0.5, blue: 0.9),
        secondaryColor: Color(red: 0.9, green: 0.3, blue: 0.5)
    )
}
