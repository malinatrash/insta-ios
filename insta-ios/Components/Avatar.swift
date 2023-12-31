import SwiftUI

struct Avatar: View {
    @State private var image: UIImage? = nil
    let username: String
    
    init(username: String) {
        self.username = username
    }
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color(hex: 0x0be78c))
                    .background(Color.white)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.5), radius: 8, x: 0, y: 4)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color(hex: 0x0be78c))
                    .background(Color.white)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
            }
        }.onAppear {
            loadImage(from: "http://92.51.45.202:8000/image?username=\(username)")
        }
        
    }
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(username: "exampleUsername")
    }
}
