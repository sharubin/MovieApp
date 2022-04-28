//
//  TrailersView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 14.03.2022.
//

import UIKit

class TrailersView: UIView {
    
    private let trailersCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 20
        $0.minimumInteritemSpacing = 20
    }
    
    lazy var trailersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: trailersCollectionViewFlowLayout).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.allowsMultipleSelection = true
        $0.register(TrailersCollectionViewCell.self, forCellWithReuseIdentifier: TrailersCollectionViewCell.identifier)
        $0.isPagingEnabled = true
    }
    
    private let headingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.TrailersCollectionController.white
        $0.font = Fonts.TrailersCollectionController.categoryFont
        $0.text = Strings.TrailersCollectionController.trailers
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(headingLabel)
        addSubview(trailersCollectionView)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        trailersCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        headingLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
        }
    }
    
}
