//
//  RegisterView.swift
//  insta-ios
//
//  Created by Pavel Naumov on 30.12.2023.
//

import Foundation
import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var lastName = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.vertical, 10)
                .autocapitalization(.none)
            
            TextField("Lastname", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.vertical, 10)
                .autocapitalization(.none)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.vertical, 10)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            Button(action: {
                // Действие для регистрации
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Spacer()
            Spacer()
        }
        .padding()
        .navigationBarTitle("Register", displayMode: .inline)
    }
}


#Preview {
    RegisterView()
}
