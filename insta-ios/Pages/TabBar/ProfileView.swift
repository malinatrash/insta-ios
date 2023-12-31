import SwiftUI

struct ProfileView: View {
    @ObservedObject var currentUserManager = CurrentUserManager.shared
    @State private var image: UIImage? = nil
    
    var body: some View {
        NavigationView {
            Group {
                if let user = currentUserManager.currentUser {
                    VStack {
                        HStack(spacing: 20) {
                            Avatar(username: user.username)
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack {
                                        Text("3")
                                        Text("Публикации").font(.caption)
                                    }
                                    VStack {
                                        Text("2591")
                                        Text("Подписчики").font(.caption)
                                    }
                                    VStack {
                                        Text("91")
                                        Text("Подписки").font(.caption)
                                    }
                                }
                            }
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(user.name) \(user.lastname)")
                                .font(.callout)
                                .padding(.top)
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                                .font(.caption)
                                .fontWeight(.light)
                        }.padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.top)
                    .navigationBarItems(trailing:
                                            HStack {
                        Button(action: {
                            self.currentUserManager.currentUser = nil
                        }) {
                            Image(systemName: "gear")
                        }
                        // Other buttons...
                    }
                    )
                    .navigationBarTitle(user.username)
                } else {
                    Text("Loading...")
                }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        // Creating a sample user for preview
        let user = User(ID: 1, username: "malinatrash", name: "Наумов", lastname: "Саша", password: "testPassword")
        
        // Providing a static instance of CurrentUserManager with a sample user
        let currentUserManager = CurrentUserManager()
        currentUserManager.set(user: user)
        
        return ProfileView(currentUserManager: currentUserManager)
    }
}
