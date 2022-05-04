//
//  ActingCrewTableViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 13.04.2022.
//

import UIKit

class ActingTableViewCell: UITableViewCell {

    static let identifier = "ActingTableViewCell"
    
    private let dateLabel = UILabel().then {
        $0.textColor = .black
    }
    
    private let movieAndJobLabel = UILabel().then {
        $0.textColor = Colors.ActingController.black
        $0.font = Fonts.ActingController.cellFont
        $0.numberOfLines = 0
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
        contentView.addSubview(dateLabel)
        contentView.addSubview(movieAndJobLabel)
        setNeedsUpdateConstraints()
    }

    func updateCell(model: CrewCastCellModel, year: String) {
        movieAndJobLabel.attributedText = createAttributedString(model: model)
        dateLabel.text = year
    }
    
    func createAttributedString(model: CrewCastCellModel) -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString()
        let boldTitle = NSAttributedString(string: model.title + Strings.ActingController.space, attributes: [.font: Fonts.ActingController.boldForAttributtedString])
        let character = NSAttributedString(string: Strings.ActingController.asString + (model.job ?? model.character ?? Strings.ActingController.noInfo), attributes: [.font: Fonts.ActingController.usualFont])
        attributedText.append(boldTitle)
        attributedText.append(character)
    
        return attributedText
    }

    override func updateConstraints() {
        super.updateConstraints()

        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(50)
        }
        
        movieAndJobLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel.snp.trailing).offset(5)
            $0.top.trailing.bottom.equalToSuperview()
        }
    }
}
