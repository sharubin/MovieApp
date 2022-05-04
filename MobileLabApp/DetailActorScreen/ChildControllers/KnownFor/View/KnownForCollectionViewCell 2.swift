//
//  KnownForCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.04.2022.
//

import UIKit

class KnownForCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "KnownForCollectionViewCell"

    private let imageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
    }

    private let movieNameLabel =  UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.KnownForController.black
        $0.font = Fonts.MovieCell.nameBoldFont
        $0.numberOfLines = 0
        $0.textAlignment = .center
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
        contentView.addSubview(imageView)
        contentView.addSubview(movieNameLabel)
        setNeedsUpdateConstraints()
    }
    
    func updateCell(data: KnownForCast) {
        movieNameLabel.text = data.title
        guard let photo = data.posterPath else { return }
        let url = URL(string: String(format: Links.imageLink, photo))
        imageView.kf.setImage(with: url)
    }

    override func updateConstraints() {
        super.updateConstraints()

        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
    }
}
