//
//  TabView.swift
//  insta-ios
//
//  Created by Pavel Naumov on 30.12.2023.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var currentUserManager = CurrentUserManager.shared
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Feed")
                }
                .tag(0)
            
            AddPostView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Add")
                }
                .tag(0)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text(currentUserManager.currentUser?.username ?? "Profile")
                }
                .tag(1)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
