//
//  TopBilledCastView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 29.03.2022.
//

import UIKit

class TopBilledCastView: UIView {
    
    private let headingLabelView = UIView()
    
    private let headingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.CategoryCollectionController.black
        $0.font = Fonts.CategoryCollectionController.categoryFont
        $0.text = Strings.DetailTopBilledCastController.header
    }
    
    private let topBilledCastCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 16
    }
    
    lazy var topBilledCastCollectionView = UICollectionView(frame: .zero, collectionViewLayout: topBilledCastCollectionViewFlowLayout).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        $0.register(TopBilledCastCollectionViewCell.self, forCellWithReuseIdentifier: TopBilledCastCollectionViewCell.identifier)
    }
    
    private let stack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
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
        addSubview(stack)
        stack.addArrangedSubview(headingLabelView)
        headingLabelView.addSubview(headingLabel)
        stack.addArrangedSubview(topBilledCastCollectionView)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        headingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.bottom.trailing.equalToSuperview()
        }
        
        topBilledCastCollectionView.snp.makeConstraints {
            $0.height.equalTo(340)
        }
    }
    
}
