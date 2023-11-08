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
        setupBinding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBinding() {
        rootView.searchBar.delegate = self
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let standardAppearance = UINavigationBarAppearance.defaultAppearance()
        navigationItem.applyAllAppearance(standardAppearance)
        navigationItem.title = "Home Assignment"
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        debugPrint(searchBar.text)
    }
}

extension UINavigationItem {
    func applyAllAppearance(_ appearance: UINavigationBarAppearance) {
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
        compactAppearance = appearance
        compactScrollEdgeAppearance = appearance
    }
}

extension UINavigationBarAppearance {
    static func defaultAppearance() -> UINavigationBarAppearance {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundImage = UIImage()
        standardAppearance.backgroundColor = .wildSand
        standardAppearance.shadowImage = UIImage()
        standardAppearance.shadowColor = .clear
        return standardAppearance
    }
}
