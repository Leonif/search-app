//
//  ApiService.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//
import Foundation

func readJSONFile<T:Decodable>(forName name: String) throws -> T {
      // creating a path from the main bundle and getting data object from the path
       if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
           
           // Decoding the Product type from JSON data using JSONDecoder() class.
           let response = try JSONDecoder().decode(T.self, from: jsonData)
           return response
       } else {
           throw SearchAppError.objectNotFound
       }
}

enum SearchAppError: Error {
    case objectNotFound
}
