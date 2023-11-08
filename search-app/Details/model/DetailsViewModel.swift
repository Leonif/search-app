//
//  DetailsViewModel.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

import Foundation
import Combine

final class DetailsViewModel: ObservableObject {
    let errorSubject = CurrentValueSubject<Error?, Never>(nil)
    
    @Published private(set) var isBusy: Bool = false
    @Published private(set) var product: Product
    
    private var bag = Set<AnyCancellable>()
    
    init(product: Product) {
        self.product = product
    }
}
