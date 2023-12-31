//
//  insta_iosApp.swift
//  insta-ios
//
//  Created by Pavel Naumov on 29.12.2023.
//
import SwiftUI

@main
struct insta_iosApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView().accentColor(Color(hex: 0x0be78c))
        }
    }
    
    
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
