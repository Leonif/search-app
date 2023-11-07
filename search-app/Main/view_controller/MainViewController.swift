//
//  MainViewController.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 07.11.2023.
//

import UIKit

final class MainViewController: UIViewController {

    private let rootView: MainView
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.rootView = MainView()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
}

