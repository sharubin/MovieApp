//
//  BackdropCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 31.03.2022.
//

import UIKit

class BackdropCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BackdropCollectionViewCell"
    
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
