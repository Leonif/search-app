//
//  MainView.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 07.11.2023.
//

import UIKit
import SnapKit

final class MainView: UIView {
    
    private(set) var searchBar = UISearchBar()
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        setupSelf()
        setupSearchBar()
        setupConstraints()
    }
    
    private func setupSelf() {
        backgroundColor = .yellow
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Search for images"
        searchBar.barTintColor = .frenchGray
        searchBar.searchTextField.backgroundColor = .white
        addSubview(searchBar)
    }
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
}
