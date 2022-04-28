//
//  DiscoverView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.04.2022.
//

import UIKit

class DiscoverView: UIView {
    
    private let discoverCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .vertical
        $0.minimumInteritemSpacing = 20
    }
    
    lazy var discoverCollectionView = UICollectionView(frame: .zero, collectionViewLayout: discoverCollectionViewFlowLayout).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        $0.register(DiscoverCollectionViewCell.self, forCellWithReuseIdentifier: DiscoverCollectionViewCell.identifier)
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
        addSubview(discoverCollectionView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        discoverCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
