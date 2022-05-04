//
//  CategoryScreenView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 04.03.2022.
//

import UIKit

class CategoryScreenView: UIView {
    
    private let headingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.CategoryCollectionController.black
        $0.font = Fonts.CategoryCollectionController.categoryFont
    }
    
    private let movieCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 16
    }
    
    lazy var movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: movieCollectionViewFlowLayout).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.allowsMultipleSelection = true
        $0.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        $0.register(SkeletonCategoryCollectionViewCell.self, forCellWithReuseIdentifier: SkeletonCategoryCollectionViewCell.identifier)
        $0.layer.cornerRadius = 20
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
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(stack)
        stack.addArrangedSubview(headingLabel)
        stack.addArrangedSubview(movieCollectionView)
    }
    
    func updateCategory(category: Category) {
        headingLabel.text = category.rawValue
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        stack.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        movieCollectionView.snp.makeConstraints {
            $0.height.equalTo(310)
        }
    }
}
