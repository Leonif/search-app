//
//  Product.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

struct Product: Decodable {
    let id: String
    let text: String
    let smalImageUrlString: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        
        let urls = try container.nestedContainer(keyedBy: UrlsCodingKeys.self, forKey: .urls)
        smalImageUrlString = try urls.decode(String.self, forKey: .small)
        
        if let d = try container.decodeIfPresent(String.self, forKey: .description) {
            text = d
        } else {
            text = try container.decode(String.self, forKey: .altDescription)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case altDescription = "alt_description"
        case urls
    }
    
    enum UrlsCodingKeys: String, CodingKey {
        case small
        case thumb
    }
}
