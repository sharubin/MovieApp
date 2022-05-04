//
//  TopBilledCastCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 29.03.2022.
//

import UIKit
import Kingfisher

class TopBilledCastCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopBilledCastCollectionViewCell"

    private let imageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }

    private let actorNameLabel =  UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.MovieCell.black
        $0.font = Fonts.MovieCell.nameBoldFont
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }

    private let characterNameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.MovieCell.black
        $0.font = Fonts.MovieCell.nameLightFont
        $0.numberOfLines = 0
        $0.textAlignment = .center
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
        contentView.addSubview(imageView)
        contentView.addSubview(actorNameLabel)
        contentView.addSubview(characterNameLabel)
        setNeedsUpdateConstraints()
        setupShadowAndCornerRadius()
    }
    
    func updateCell(actor: Cast) {
        actorNameLabel.text = actor.name
        characterNameLabel.text = actor.character
        guard let photo = actor.profilePath else {
            imageView.image = UIImage(named: "user")
            return
        }
        let url = URL(string: String(format: Links.imageLink, photo))
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "user"))
    }
    
    private func setupShadowAndCornerRadius() {
        contentView.layer.cornerRadius = 5.0
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

        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        actorNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        characterNameLabel.snp.makeConstraints {
            $0.top.equalTo(actorNameLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
    }
}
