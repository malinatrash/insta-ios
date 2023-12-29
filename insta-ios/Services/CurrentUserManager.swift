import Combine

struct User: Codable {
    var ID: Int
    var username: String
    var name: String
    var lastname: String
    var password: String
}

class CurrentUserManager: ObservableObject {
    
    @Published var currentUser: User?
    
    static let shared = CurrentUserManager()
    
    private init() {}
    
    func set(user: User) {
        self.currentUser = user
    }
    
    func logout() {
        self.currentUser = nil
    }
}
