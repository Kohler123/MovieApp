
import Foundatio
struct MyModel: Decodable {
    let firstString: String
    let stringArray: [String]

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        firstString = try container.decode(String.self)
        stringArray = try container.decode([String].self)
    }
}


struct MovieData: Decodable{
    var Year: String
    var Director: String
    var Rated: String
    var Released: String
    var Poster: String
}
