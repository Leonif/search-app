//
//  MainView.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 07.11.2023.
//

import UIKit
import SnapKit

final class MainView: UIView {
    
    var isLoading: Bool = false { didSet {
        updateUI()
    }}
    
    private(set) var searchBar = UISearchBar()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupLayout())
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        if isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    private func setup() {
        setupSelf()
        setupSearchBar()
        setupActivityIndicator()
        setupCollectionView()
        setupConstraints()
    }
    
    private func setupSelf() {
        backgroundColor = .white
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Search for images"
        searchBar.barTintColor = .frenchGray
        searchBar.searchTextField.backgroundColor = .white
        addSubview(searchBar)
    }
    
    private func setupActivityIndicator() {
        activityIndicator.color = UIColor.bilobaFlower
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)
    }
    
    private func setupCollectionView() {
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.id)
        collectionView.backgroundColor = .clear
        addSubview(collectionView)
    }
    
    private func setupLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(80))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section =  NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalToSuperview()
            make.bottom.trailing.equalToSuperview()
        }
    }
}
