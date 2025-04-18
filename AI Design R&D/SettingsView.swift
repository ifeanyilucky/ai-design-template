//
//  SettingsView.swift
//  AI Design R&D
//
//  Created by Great Codack's Macbook on 4/18/25.
//

import SwiftUI

struct SettingsView: View {
    let backgroundColor: Color
    
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var biometricLoginEnabled = true
    @State private var dataSync = true
    @State private var selectedLanguage = "English"
    
    let languages = ["English", "Spanish", "French", "German", "Chinese", "Japanese"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("Account Settings")) {
                        SettingRow(icon: "person.fill", iconColor: .blue, title: "Account Information")
                    }
                    
                    NavigationLink(destination: Text("Security Settings")) {
                        SettingRow(icon: "lock.fill", iconColor: .green, title: "Security")
                    }
                    
                    NavigationLink(destination: Text("Privacy Settings")) {
                        SettingRow(icon: "hand.raised.fill", iconColor: .purple, title: "Privacy")
                    }
                }
                
                Section(header: Text("Preferences")) {
                    Toggle(isOn: $notificationsEnabled) {
                        SettingRow(icon: "bell.fill", iconColor: .red, title: "Notifications")
                    }
                    
                    Toggle(isOn: $darkModeEnabled) {
                        SettingRow(icon: "moon.fill", iconColor: .indigo, title: "Dark Mode")
                    }
                    
                    Toggle(isOn: $biometricLoginEnabled) {
                        SettingRow(icon: "touchid", iconColor: .pink, title: "Biometric Login")
                    }
                    
                    Toggle(isOn: $dataSync) {
                        SettingRow(icon: "arrow.triangle.2.circlepath", iconColor: .orange, title: "Data Sync")
                    }
                    
                    Picker("Language", selection: $selectedLanguage) {
                        ForEach(languages, id: \.self) { language in
                            Text(language).tag(language)
                        }
                    }
                }
                
                Section(header: Text("App")) {
                    NavigationLink(destination: Text("About Screen")) {
                        SettingRow(icon: "info.circle.fill", iconColor: .blue, title: "About")
                    }
                    
                    NavigationLink(destination: Text("Help & Support")) {
                        SettingRow(icon: "questionmark.circle.fill", iconColor: .teal, title: "Help & Support")
                    }
                    
                    NavigationLink(destination: Text("Terms & Conditions")) {
                        SettingRow(icon: "doc.text.fill", iconColor: .gray, title: "Terms & Conditions")
                    }
                    
                    Button(action: {}) {
                        SettingRow(icon: "arrow.right.square.fill", iconColor: .red, title: "Sign Out")
                    }
                }
                
                Section(footer: Text("AI Design R&D v1.0.0")) {
                    // Empty section for footer
                }
            }
            .listStyle(InsetGroupedListStyle())
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Settings", displayMode: .large)
        }
    }
}

// Helper view for consistent setting rows
struct SettingRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(iconColor)
                .frame(width: 30, height: 30)
            
            Text(title)
                .font(.body)
        }
    }
}

#Preview {
    SettingsView(backgroundColor: Color(red: 0.95, green: 0.95, blue: 0.97))
}
