
import UIKit
import SwiftUI

struct ContentView: View {
    @ObservedObject var apiData: APIData = APIData(Title: "")
    @State var Title: String = ""
    @State var Year: String = ""
    @State var Director: String = ""
    @State var Rated: String = ""
    @State var Released: String = ""
    @State var title_String: String = ""
    //@State var Poster: String = ""

    var body: some View {
        VStack {
            let imgUrl = URL(string: "https://toppng.com/public/uploads/thumbnail/jpg-black-and-white-download-free-to-use-cliparts-transparent-background-popcorn-clipart-11562881064ldtwbdfjez.png")
            
            AsyncImage(url: imgUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let returnedImage):
                    returnedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                default:
                    Image(systemName: "Questionmark")
                }
            }
            
            //Text("Poster" + String(self.Poster))
            Text("Title:" + String(self.Title))
                .padding()
            Text("Rated:" + String(self.Rated))
            Text("Year:" + String(self.Year))
                .padding()
            Text("Release:" + String(self.Released))
                .padding()
            Text("Director:" + String(self.Director))
            
            TextField("Title", text: $title_String).multilineTextAlignment(.center).padding(6.0)
                .background(RoundedRectangle(cornerRadius: 4.0, style: .continuous)
                              .stroke(.gray, lineWidth: 1.0))
                .padding()
            
            Button("Search"){
                self.Title = title_String
                    apiData.fetchNew(Title: self.Title)
                    self.Year = apiData.Year!
                    self.Director = apiData.Director!
                    self.Rated = apiData.Rated!
                    self.Released = apiData.Released!
            } .tint(.green)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }

}
