//
//  MovieCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 04.03.2022.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    static let identifier = "MovieCollectionViewCell"

    private let imageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let ratingView = RatingView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

    private let movieNameLabel =  UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.MovieCell.black
        $0.font = Fonts.MovieCell.nameBoldFont
        $0.numberOfLines = 0
    }

    private let movieDateLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.MovieCell.black
        $0.font = Fonts.MovieCell.nameLightFont
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    private func setup() {
        contentView.addSubview(imageView)
        imageView.addSubview(ratingView)
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(movieDateLabel)
        setNeedsUpdateConstraints()
    }
    
    func updateCell(movie: MovieCellModel) {
        ratingView.setRating(movie.rating, with: movie.isSeen ? 0 : 5)
        imageView.kf.setImage(with: movie.getLink())
        movieNameLabel.text = movie.movieName
        movieDateLabel.text = movie.movieDate
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        super.updateConstraints()

        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        ratingView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().inset(10)
            $0.height.width.equalTo(40)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        movieDateLabel.snp.makeConstraints {
            $0.top.equalTo(movieNameLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(5)
        }
    }
}
