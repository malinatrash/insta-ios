//
//  ProfileView.swift
//  insta-ios
//
//  Created by Pavel Naumov on 29.12.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var currentUserManager = CurrentUserManager.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let user = currentUserManager.currentUser {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.blue)
                    
                    Text(user.username)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("\(user.name) \(user.lastname)")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                } else {
                    Image(systemName: "person.circle.fill")
                                       .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       .frame(width: 150, height: 150)
                                       .foregroundColor(.blue)
                                   
                                   Text("malinatrash")
                                       .font(.title)
                                       .fontWeight(.bold)
                                   
                                   HStack {
                                       Text("\("Pavel") \("Naumov")")
                                           .font(.headline)
                                           .fontWeight(.bold)
                                   }
                                   
                               
                }
                
                Spacer()
            }
            .padding()
            .navigationBarItems(trailing:
                HStack {
                
                Button(action: {
                    // Действия при нажатии на вторую кнопку
                    // Дополнительные действия
                }) {
                    Image(systemName: "gear")
                }
                    Button(action: {
                        // Действия при нажатии на первую кнопку
                        self.currentUserManager.currentUser = nil // Устанавливаем currentUser в nil или другие действия
                    }) {
                        Image(systemName: "exit_to")
                    }
                    
                    
                }
            )
        }
    }
}


#Preview {
    ProfileView()
}
