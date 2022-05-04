//
//  ActorsView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 21.03.2022.
//

import UIKit

class ActorsView: UIView {
    
    private let headingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.CategoryCollectionController.black
        $0.font = Fonts.CategoryCollectionController.categoryFont
        $0.text = Strings.ActorsController.header
    }
    
    let actorsTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = false
        $0.register(ActorsTableViewCell.self, forCellReuseIdentifier: ActorsTableViewCell.identifier)
        $0.register(SkeletonTableViewCell.self, forCellReuseIdentifier: SkeletonTableViewCell.identifier)
        $0.layer.cornerRadius = 20
        $0.rowHeight = 100
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
        stack.addArrangedSubview(actorsTableView)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        stack.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        actorsTableView.snp.makeConstraints {
            $0.height.equalTo(2000)
        }
    }

}
