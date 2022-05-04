//
//  DiscoverTableViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.04.2022.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {

    static let identifier = "DiscoverCollectionViewCell"
    
    private let avatarImageView = UIImageView()
    
    private let movieNameLabel = UILabel().then {
        $0.textColor = Colors.TabBarController.black
    }

    private let movieDateLabel = UILabel().then {
        $0.textColor = Colors.TabBarController.black
        $0.font = Fonts.TabBarController.light
    }
    
    private let descriptionLabel = UILabel().then {
        $0.textColor = Colors.TabBarController.black
        $0.numberOfLines = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }

    private func setup() {
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(movieDateLabel)
        contentView.addSubview(descriptionLabel)
        setNeedsUpdateConstraints()
        setupShadowAndCornerRadius()
    }

    func updateCell(model: DiscoverResult) {
        movieNameLabel.text = model.title
        movieDateLabel.text = model.releaseDate
        descriptionLabel.text = model.overview
        let url = URL(string: String(format: Links.imageLink, model.posterPath))
        avatarImageView.kf.setImage(with: url)
    }
    
    private func setupShadowAndCornerRadius() {
        contentView.layer.cornerRadius = 2.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        self.layer.cornerRadius = 10
    }

    override func updateConstraints() {
        super.updateConstraints()

        avatarImageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(5)
        }

        movieDateLabel.snp.makeConstraints {
            $0.top.equalTo(movieNameLabel.snp.bottom).offset(15)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(5)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(movieDateLabel.snp.bottom).offset(15)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(5)
        }
    }
}
