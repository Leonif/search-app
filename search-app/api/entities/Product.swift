//
//  Product.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

struct Product: Decodable {
    let id: String
    let description: String?
    let altDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case altDescription = "alt_description"
    }
}
