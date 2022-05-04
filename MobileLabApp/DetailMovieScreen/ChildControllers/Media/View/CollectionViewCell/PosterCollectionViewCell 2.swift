//
//  MediaCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 30.03.2022.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PosterCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        setNeedsUpdateConstraints()
    }
    
    func updateCell(model: MediaImage) {
        imageView.kf.setImage(with: model.linkImage)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
