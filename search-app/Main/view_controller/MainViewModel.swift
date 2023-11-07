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
    
    private var cancellabeles = Set<AnyCancellable>()
    
}
