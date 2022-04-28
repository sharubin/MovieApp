//
//  SkeletonCategoryCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 27.04.2022.
//

import UIKit

class SkeletonCategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SkeletonCategoryCollectionViewCell"

    let imageView = UIView().then {
        $0.backgroundColor = Colors.CategoryCollectionController.gray
    }
    
    let ratingView = UIView().then {
        $0.backgroundColor = Colors.CategoryCollectionController.gray
    }
    
     let movieNameLabel = UIView().then {
         $0.backgroundColor = Colors.CategoryCollectionController.gray
     }
    
     var movieDateLabel = UIView().then {
         $0.backgroundColor = Colors.CategoryCollectionController.gray
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
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(movieDateLabel)
        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(10)
        }
        
        movieDateLabel.snp.makeConstraints {
            $0.top.equalTo(movieNameLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(10)
        }
    }
}
