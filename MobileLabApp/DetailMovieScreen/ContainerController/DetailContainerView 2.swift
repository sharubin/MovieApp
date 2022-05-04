//
//  DetailContainerView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.03.2022.
//

import UIKit
import Then
import SnapKit

class DetailContainerView: UIView {

    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    private let contentView = UIView()
    
     let fullStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
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
        setNeedsUpdateConstraints()
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(fullStack)
        backgroundColor = Colors.CategoryCollectionController.white
    }
    
    func addView(view: UIView) {
        fullStack.addArrangedSubview(view)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        fullStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
