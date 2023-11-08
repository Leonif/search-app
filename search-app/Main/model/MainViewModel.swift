//
//  MainViewModel.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 07.11.2023.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    
    let errorSubject = CurrentValueSubject<Error?, Never>(nil)
    
    @Published private(set) var isBusy: Bool = false
    @Published private(set) var products: [Product] = []
    
    private var cancellabeles = Set<AnyCancellable>()

    init() {
       loadData()
    }
    
    private func loadData() {
        isBusy = true
        do {
            let response: Products = try readJSONFile(forName: "unsplash")
            isBusy = false
            products = response.results
            
        } catch {
            isBusy = false
            errorSubject.send(error)
        }
    }
}

