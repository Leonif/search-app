//
//  Products.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

struct Products: Decodable {
    let total: Int
    let totalPages: Int
    
    let results: [Product]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
     }
}
