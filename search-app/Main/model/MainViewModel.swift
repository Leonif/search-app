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
    let detailsTapped = PassthroughSubject<Product, Never>()
    let searchInProgress = PassthroughSubject<String?, Never>()
    
    @Published private(set) var isBusy: Bool = false
    private var origin: [Product] = []
    @Published private(set) var products: [Product] = []
    
    var bag = Set<AnyCancellable>()

    init() {
        loadData()
        setupBinding()
    }
    
    private func setupBinding() {
        searchInProgress.sink { [weak self] text in
            guard let self else { return }
            
            if let text, !text.isEmpty {
                self.products = self.origin.filter { $0.text.uppercased().contains(text.uppercased()) }
            } else {
                self.products = self.origin
            }
        }.store(in: &bag)
    }
    
    private func loadData() {
        isBusy = true
        do {
            let response: Products = try readJSONFile(forName: "unsplash")
            isBusy = false
            origin = response.results
            products = response.results
            
        } catch {
            isBusy = false
            errorSubject.send(error)
        }
    }
}

