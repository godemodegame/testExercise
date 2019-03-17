import Foundation

// Structure of json file
struct Json: Decodable {
    var data: [Item]        // Data to display
    var view: [String]      // Array with a sequence of display
}

struct Item: Decodable {
    var name: String
    var data: Description
}

struct Description: Decodable {
    var text: String?
    var url: URL? // urlToImage
    var selectedId: Int?
    var variants: [Variant]?
}

struct Variant: Decodable {
    var id: Int
    var text: String
}
