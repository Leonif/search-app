//
//  DetailsView.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

import UIKit
import SnapKit
import SDWebImage

final class DetailsView: UIView {
    
    var product: Product? { didSet {
        updateUI()
    }}
    
    private let productImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let authorImageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let userNameLabel = UILabel()
    private let bioLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI() {
        guard let product else { return }
        productImageView.sd_setImage(with: URL(string: product.mediumImageUrlString!))
        authorImageView.sd_setImage(with: URL(string: product.user.imageUrlString!))
        descriptionLabel.text = product.text
        fullNameLabel.text = product.user.name
        userNameLabel.text = product.user.userName
        bioLabel.text = product.user.bio
    }
    
    private func setup() {
        setupSelf()
        setupProductImageView()
        setupDescriptionLabel()
        setupAuthorImageView()
        setupFullNameLabel()
        setupUserNameLabel()
        setupBioLabel()
        setupConstraints()
    }
    
    private func setupSelf() {
        backgroundColor = .white
    }
    
    private func setupProductImageView() {
        productImageView.clipsToBounds = true
        productImageView.contentMode = .scaleAspectFill
        addSubview(productImageView)
     }
    
    
    private func setupDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        addSubview(descriptionLabel)
    }
    
    private func setupAuthorImageView() {
        authorImageView.contentMode = .scaleAspectFill
        authorImageView.clipsToBounds = true
        addSubview(authorImageView)
    }
    
    private func setupFullNameLabel() {
        fullNameLabel.font = .systemFont(ofSize: 14)
        fullNameLabel.textColor = .black
        fullNameLabel.textAlignment = .left
        fullNameLabel.numberOfLines = 0
        fullNameLabel.lineBreakMode = .byWordWrapping
        addSubview(fullNameLabel)
    }
    
    private func setupUserNameLabel() {
        userNameLabel.font = .systemFont(ofSize: 14)
        userNameLabel.textColor = .black
        userNameLabel.textAlignment = .left
        userNameLabel.numberOfLines = 0
        userNameLabel.lineBreakMode = .byWordWrapping
        addSubview(userNameLabel)
    }
    
    private func setupBioLabel() {
        bioLabel.font = .systemFont(ofSize: 14)
        bioLabel.textColor = .black
        bioLabel.textAlignment = .left
        bioLabel.numberOfLines = 0
        bioLabel.lineBreakMode = .byWordWrapping
        addSubview(bioLabel)
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-8)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16).priority(999)
            make.bottom.equalTo(fullNameLabel.snp.top).offset(-16)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(authorImageView.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(16).priority(999)
            make.bottom.equalTo(userNameLabel.snp.top).offset(-4)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(authorImageView.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(16).priority(999)
            make.bottom.equalTo(bioLabel.snp.top).offset(-4)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.leading.equalTo(authorImageView.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(16).priority(999)
            make.bottom.lessThanOrEqualTo(safeAreaLayoutGuide).offset(-4)
        }
        
        authorImageView.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel)
            make.leading.equalToSuperview().offset(16)
            make.size.equalTo(80)
            make.bottom.lessThanOrEqualTo(safeAreaLayoutGuide).offset(-4)
        }
    }
}
