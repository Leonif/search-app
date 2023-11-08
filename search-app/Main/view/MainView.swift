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
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
    }
}
