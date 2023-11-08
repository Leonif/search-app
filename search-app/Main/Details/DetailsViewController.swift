//
//  PictureDetailsViewController.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

import UIKit
import Combine

final class DetailsViewController: UIViewController {

    private let rootView: DetailsView
    private let viewModel: DetailsViewModel
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: DetailsViewModel) {
        self.rootView = DetailsView()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    
    private func setupBinding() {
        viewModel.$product.sink { [unowned self] product in
            rootView.product = product
        }.store(in: &bag)
        
        viewModel.errorSubject
            .compactMap { $0 }
            .sink { [unowned self] error in
                showAlert(with: error)
            }.store(in: &bag)
    }
    
    deinit {
        debugPrint("delete")
    }
}
