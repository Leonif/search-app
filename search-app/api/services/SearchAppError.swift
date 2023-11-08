//
//  SearchAppError.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

import Foundation

enum SearchAppError: Error {
    case objectNotFound
}

extension SearchAppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .objectNotFound:
            return "File not found"
        }
    }
}
