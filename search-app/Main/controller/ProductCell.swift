//
//  ProductCell.swift
//  search-app
//
//  Created by LEONID NIFANTIJEV on 08.11.2023.
//

import UIKit
import SnapKit
import SDWebImage

final class ProductCell: UICollectionViewCell {
    
    static let id = "ProductCell"
    
    private let iconImageView = UIImageView()
    private var titleLabel = UILabel()
    private let disclosureImageView = UIImageView()
    private let separatorView = UIView()
    
    private let imageSize: CGFloat = 80
    
    override init(frame: CGRect) {
        super.init(frame: frame); setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder); setup()
    }
    
    func bind(_ product: Product) {
        titleLabel.text = product.text
        iconImageView.sd_setImage(with: URL(string: product.smallImageUrlString!), placeholderImage: UIImage())
    }
    
    private func setup() {
        setupSelf()
        setupIconImageView()
        setupTitle()
        setupDisclosureImageView()
        setupSeparatorView()
        setupConstraints()
    }
    
    private func setupSelf() {
        backgroundColor = .white
        contentView.backgroundColor = .white
    }
    
    private func setupIconImageView() {
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = imageSize/2
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.borderWidth = 1
        iconImageView.layer.borderColor = UIColor.black.cgColor
        
        contentView.addSubview(iconImageView)
    }
    
    private func setupTitle() {
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
    }
    
    private func setupDisclosureImageView() {
        disclosureImageView.image = UIImage(systemName: "arrow.turn.down.right")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal)
        disclosureImageView.contentMode = .scaleAspectFit
        contentView.addSubview(disclosureImageView)
    }
    
    private func setupSeparatorView() {
        separatorView.backgroundColor = .lightGray
        contentView.addSubview(separatorView)
    }
    
    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().offset(8)
            make.size.equalTo(imageSize)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.trailing.equalTo(disclosureImageView.snp.leading).offset(-8).priority(999)
        }
        
        disclosureImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-8)
            make.size.equalTo(16)
        }
        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(iconImageView)
            make.bottom.trailing.equalToSuperview()
        }
    }
}
