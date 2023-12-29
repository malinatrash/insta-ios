//
//  AuthView.swift
//  insta-ios
//
//  Created by Pavel Naumov on 29.12.2023.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isAuthenticated = false
    @State private var isRegistering = false
    
    func login() {
        guard let url = URL(string: "http://localhost:8000/users/login") else {
            print("Invalid URL")
            return
        }
        
        // Подготовка параметров запроса (username и password)
        let parameters: [String: String] = [
            "username": username,
            "password": password
        ]
        

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        request.url = components.url
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    return
                }
                
                if (200..<300).contains(httpResponse.statusCode), let data = data {
                    do {
                        let user = try JSONDecoder().decode(User.self, from: data)
                        CurrentUserManager.shared.set(user: user)
                        print("User ID: \(user.ID)")
                        print("Username: \(user.username)")
                        print("Name: \(user.name)")
                        print("Lastname: \(user.lastname)")
                        print("Password: \(user.password)")
                        isAuthenticated = true
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } else {
                    print("Error: Unexpected status code - \(httpResponse.statusCode)")
                }
            }.resume()
        }


    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .disableAutocorrection(true)
                    .padding(.vertical, 10)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                
                Button(action: {
                    login()
                }) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                NavigationLink(
                                    destination: HomeView(),
                                    isActive: $isAuthenticated,
                                    label: { EmptyView() }
                                ).opacity(0)
                
                Spacer()
                Spacer()
                
                NavigationLink(destination: RegisterView(), isActive: $isRegistering) {
                    Text("Don't have an account? Register")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .navigationBarTitle("Login", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

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
    LoginView()
}
