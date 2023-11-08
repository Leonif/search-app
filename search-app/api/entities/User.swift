//
//  User.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

struct User: Decodable {
    let id: String
    let imageUrlString: String?
    let userName: String
    let name: String
    let bio: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.userName = try container.decode(String.self, forKey: .username)
        self.name = try container.decode(String.self, forKey: .name)
        self.bio = try container.decode(String.self, forKey: .bio)
        
        let urls = try container.nestedContainer(keyedBy: UrlsCodingKeys.self, forKey: .profileImage)
        imageUrlString = try urls.decode(String.self, forKey: .medium)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case profileImage = "profile_image"
        case username
        case name
        case bio
    }
    
    enum UrlsCodingKeys: String, CodingKey {
        case small
        case medium
    }
}
