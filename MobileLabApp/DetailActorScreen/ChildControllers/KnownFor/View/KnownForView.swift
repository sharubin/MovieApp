//
//  KnownForView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.04.2022.
//

import UIKit

class KnownForView: UIView {
    
    private let headingLabelView = UIView()
    
    private let headingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.KnownForController.black
        $0.font = Fonts.KnownForController.categoryFont
        $0.text = Strings.KnownForController.header
    }
    
    private let knownForCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 16
    }
    
    lazy var knownForCollectionView = UICollectionView(frame: .zero, collectionViewLayout: knownForCollectionViewFlowLayout).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        $0.register(KnownForCollectionViewCell.self, forCellWithReuseIdentifier: KnownForCollectionViewCell.identifier)
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
        stack.addArrangedSubview(knownForCollectionView)
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
        
        knownForCollectionView.snp.makeConstraints {
            $0.height.equalTo(340)
        }
    }
}
