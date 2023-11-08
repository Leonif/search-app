//
//  DetailsView.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

import UIKit
import SnapKit

final class DetailsView: UIView {
    
    var product: Product? { didSet {
        updateUI()
    }}
    
    private let productImageView = UIImageView()
    
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        productImageView.sd_setImage(with: URL(string: product!.smalImageUrlString!), placeholderImage: UIImage())
    }
    
    private func setup() {
        setupSelf()
        setupProductImageView()
        setupConstraints()
    }
    
    private func setupSelf() {
        backgroundColor = .white
    }
    
    private func setupProductImageView() {
        
        productImageView.contentMode = .scaleAspectFill
        addSubview(productImageView)
     }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
