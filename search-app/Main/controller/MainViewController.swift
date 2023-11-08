//
//  MainViewController.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 07.11.2023.
//

import UIKit
import Combine

final class MainViewController: UIViewController {

    private let rootView: MainView
    private let viewModel: MainViewModel
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: MainViewModel) {
        self.rootView = MainView()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        rootView.searchBar.delegate = self
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBinding() {
        viewModel.errorSubject
            .compactMap { $0 }
            .sink { [unowned self] error in
                showAlert(with: error)
            }.store(in: &bag)
        
        viewModel.$isBusy.sink { [unowned self] isBusy in
            rootView.isLoading = isBusy
        }.store(in: &bag)
        
        viewModel.$products.sink { [unowned self] _ in
            rootView.collectionView.reloadData()
        }.store(in: &bag)
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let standardAppearance = UINavigationBarAppearance.defaultAppearance()
        navigationItem.applyAllAppearance(standardAppearance)
        navigationItem.title = "Home Assignment"
    }
    
    private func showAlert(with error: Error) {
        let message = UIAlertController(title: "Attention", message: error.localizedDescription, preferredStyle: .alert)
        present(message, animated: true, completion: nil)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        debugPrint(searchBar.text)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.id, for: indexPath) as! ProductCell
        let product = viewModel.products[indexPath.row]
        cell.bind(product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = viewModel.products[indexPath.row]
        debugPrint("TEST \(product.id)")
    }
}
