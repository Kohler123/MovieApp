
import Foundation
import UIKit
 
class APIData: ObservableObject{
    var Year: String?
    var Rated: String?
    var Released: String?
    var Director: String?
    var Poster: String?
    
    init(Title: String){
        fetchAPIData(completionHandler: { (MovieData) in
            self.Year = MovieData.Year
            self.Rated = MovieData.Rated
            self.Released = MovieData.Released
            self.Director = MovieData.Director
            self.Poster = MovieData.Poster
        }, title: Title)
    }
    
    func fetchNew (Title: String) -> Void{
            self.fetchAPIData(completionHandler: { (MovieData) in
            self.Year = MovieData.Year
            self.Rated = MovieData.Rated
            self.Released = MovieData.Released
            self.Director = MovieData.Director
            //self.Poster = MovieData.Poster
            }, title: Title)
    }

    func fetchAPIData(completionHandler: @escaping (MovieData) -> Void, title: String){
        let url = URL(string: "https://www.omdbapi.com/?apikey=a324cc08&t=[]" + String(title))!
        /*let title = String (title.replacingOccurrences(of:"", with: "+"))
         */
            
        var task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do{
                let movieData = try JSONDecoder().decode(MovieData.self, from: data)
                completionHandler(movieData)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
}

