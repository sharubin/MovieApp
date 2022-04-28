//
//  ActorsTableViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 21.03.2022.
//

import UIKit

class ActorsTableViewCell: UITableViewCell {
    
    static let identifier = "ActorsTableViewCell"
    
    private let avatarImageView = UIImageView().then {
        $0.image = UIImage(named: "play")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 40
        $0.contentMode = .scaleAspectFill
    }
    
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = Fonts.ActorsController.cellNameFont
    }

    private let popularityLabel = UILabel().then {
        $0.textColor = .black
        $0.font = Fonts.ActorsController.cellNumberFont
    }
    
    lazy private var popularityView = PopularityView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(popularityLabel)
        contentView.addSubview(popularityView)
        setNeedsUpdateConstraints()
    }

    func updateCell(model: ActorInfo) {
        popularityView.setRating(Int(model.popularity), with: 5)
        let url = URL(string: String(format: Links.imageLink, model.profilePath))
        avatarImageView.kf.setImage(with: url) { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                print("Error: \(error)")
                self.avatarImageView.image = self.getAvatar(name: model.name)
            }
        }
        nameLabel.text = model.name
        popularityLabel.text = String(model.popularity)
    }
    
    private func getAvatar(name: String) -> UIImage {
        var image = UIImage()
        let fullNameArray = name.components(separatedBy: " ")
        let lettersLabel = UILabel().then {
            $0.frame.size = CGSize(width: 50.0, height: 50.0)
            $0.textColor = UIColor.white
            if fullNameArray.count >= 2 {
                let firstName = String(fullNameArray[0].first!)
                let secondName = String(fullNameArray[1].first!)
                $0.text = String(format: "%@%@", firstName, secondName)
            } else {
                let firstName = String(name.first!)
                $0.text = String(format: "%@", firstName)
            }
            $0.textAlignment = .center
            $0.backgroundColor = .random()
            $0.layer.cornerRadius = 40.0
        }
        UIGraphicsBeginImageContext(lettersLabel.frame.size)
        lettersLabel.layer.render(in: UIGraphicsGetCurrentContext()!)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }

    override func updateConstraints() {
        super.updateConstraints()

        avatarImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
            $0.width.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(5)
        }

        popularityLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.equalTo(popularityView.snp.trailing)
            $0.trailing.equalToSuperview().inset(5)
        }
        
        popularityView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(30)
            $0.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(popularityLabel.snp.leading)
            $0.height.equalTo(5)
        }

    }
}
