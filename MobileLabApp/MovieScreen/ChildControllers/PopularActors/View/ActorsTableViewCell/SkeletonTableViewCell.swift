//
//  SkeletonTableViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 22.03.2022.
//

import UIKit

class SkeletonTableViewCell: UITableViewCell {

    static let identifier = "SkeletonTableViewCell"

    let avatarImageView = UIView().then {
        $0.backgroundColor = .gray
    }
    let nameView = UIView().then {
        $0.backgroundColor = .gray
    }
     let popularityNumberView = UIView().then {
         $0.backgroundColor = .gray
     }
     var popularityView = UIView().then {
         $0.backgroundColor = .gray
     }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
        setNeedsUpdateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameView)
        contentView.addSubview(popularityNumberView)
        contentView.addSubview(popularityView)
    }

    override func updateConstraints() {
        super.updateConstraints()
        
        avatarImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
            $0.width.equalTo(80)
        }

        nameView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(30)
            $0.width.equalTo(60)
            $0.height.equalTo(10)
        }

        popularityNumberView.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(40)
            $0.leading.equalTo(popularityView.snp.trailing).offset(10)
            $0.width.equalTo(60)
            $0.height.equalTo(10)
        }

        popularityView.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(45)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(30)
            $0.height.equalTo(5)
            $0.width.equalTo(200)
        }
    }
}
