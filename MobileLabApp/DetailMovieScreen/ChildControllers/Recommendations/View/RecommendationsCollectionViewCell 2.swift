//
//  RecommendationsCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 01.04.2022.
//

import UIKit

class RecommendationsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommendationsCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let movieName = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(movieName)
        setNeedsUpdateConstraints()
    }
    
    func updateCell(model: RecommendationDataResult) {
        imageView.kf.setImage(with: model.linkImage)
        movieName.text = model.title
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        movieName.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
