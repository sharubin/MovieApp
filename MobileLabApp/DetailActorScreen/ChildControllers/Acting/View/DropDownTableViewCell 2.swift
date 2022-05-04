//
//  DropDownTableViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 19.04.2022.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {
    
    static let identifier = "DropDownTableViewCell"
    
    private let typeLabel = UILabel().then {
        $0.textColor = Colors.ActingController.black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        backgroundColor = Colors.ActingController.gray
        contentView.addSubview(typeLabel)
        setNeedsUpdateConstraints()
    }
    
    func updateCell(model: String) {
        typeLabel.text = model
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        typeLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.bottom.equalToSuperview()
        }
    }
}
