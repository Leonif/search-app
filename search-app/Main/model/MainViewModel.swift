//
//  MainViewModel.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 07.11.2023.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    
    let errorSubject = PassthroughSubject<Error, Never>()
    
    @Published private(set) var isBusy: Bool = false
    @Published private(set) var products: [Product] = []
    
    private var cancellabeles = Set<AnyCancellable>()

    init() {
        do {
            let response: Products = try readJSONFile(forName: "unsplash")
            products = response.results
        } catch {
            debugPrint(error)
        }
    }
    
}

