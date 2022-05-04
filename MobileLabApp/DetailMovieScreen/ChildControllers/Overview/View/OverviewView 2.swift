//
//  OverviewView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.03.2022.
//

import UIKit
import Then
import SnapKit
import Kingfisher

class OverviewView: UIView {
    
    private let stack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    private let horizontalRatingButtonView = UIView()
    
    private let multilineLabelStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
        $0.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    let headerImage = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let posterImage = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let movieNameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = Colors.CategoryCollectionController.black
        $0.font = Fonts.CategoryCollectionController.categoryFont
    }
    
    private let ratingView = RatingView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    private let ratingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.CategoryCollectionController.black
        $0.font = Fonts.MovieCell.nameBoldFont
        $0.text = Strings.DetailOverviewController.userScore
    }
    
    let playTrailerButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(Strings.DetailOverviewController.playButton, for: .normal)
        $0.setTitleColor(Colors.DetailOverviewController.black, for: .normal)
        $0.setImage(UIImage(named: "playButton"), for: .normal)
    }
    
    private let infoView = UIView().then {
        $0.backgroundColor = Colors.DetailOverviewController.darkGray
    }
    
    private let dateLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let movieDurationLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let genres = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private let multilineLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
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
        backgroundColor = Colors.DetailOverviewController.lightGray
        addSubview(stack)
        stack.addArrangedSubview(headerImage)
        headerImage.addSubview(posterImage)
        stack.addArrangedSubview(movieNameLabel)
        stack.addArrangedSubview(horizontalRatingButtonView)
        horizontalRatingButtonView.addSubview(ratingView)
        horizontalRatingButtonView.addSubview(ratingLabel)
        horizontalRatingButtonView.addSubview(playTrailerButton)
        stack.addArrangedSubview(infoView)
        infoView.addSubview(dateLabel)
        infoView.addSubview(movieDurationLabel)
        infoView.addSubview(genres)
        stack.addArrangedSubview(multilineLabelStack)
        multilineLabelStack.addArrangedSubview(multilineLabel)
    }
    
    func updatePage(movieModel: DetailMovieData, crewModel: CrewData) {
        posterImage.kf.setImage(with: URL(string: String(format: Links.imageLink, movieModel.posterPath)))
        movieNameLabel.text = movieModel.title
        let intRating = Int(movieModel.voteAverage * 10)
        ratingView.setRating(intRating, with: 5)
        dateLabel.text = String(format: Strings.DetailOverviewController.date, movieModel.releaseDate)
        movieDurationLabel.text = String(format: Strings.DetailOverviewController.duration, movieModel.runtime)
        var arrayOfGenres = [String]()
        arrayOfGenres = movieModel.genres.map { $0.name }
        genres.text = arrayOfGenres.joined(separator: ", ")
        multilineLabel.attributedText = createAttributedString(movieModel: movieModel, crewModel: crewModel)
        guard let backdrop = movieModel.backdropPath else { return }
        headerImage.kf.setImage(with: URL(string: String(format: Links.imageLink, backdrop)))
    }
    
    func createAttributedString(movieModel: DetailMovieData, crewModel: CrewData) -> NSMutableAttributedString {
        var arrayOfCrew = [CrewModel]()
        arrayOfCrew = crewModel.crew.map {CrewModel(name: $0.name, job: $0.job ?? "no information")}
        
        let header = Strings.DetailOverviewController.overview
        let paragraphStyle = NSMutableParagraphStyle().then {
            $0.firstLineHeadIndent = 0
            $0.paragraphSpacingBefore = 10.0
        }
        let jobParagraphStyle = NSMutableParagraphStyle().then {
            $0.firstLineHeadIndent = 0
            $0.paragraphSpacingBefore = 0
        }
        let attributedText = NSMutableAttributedString()
        
        let taglineAttributed = NSMutableAttributedString(string: movieModel.tagline + "\n", attributes: [.font: Fonts.DetailOverviewController.tagline, .paragraphStyle: paragraphStyle])
        let headerAttributed = NSMutableAttributedString(string: header + "\n", attributes: [.font: Fonts.DetailOverviewController.header, .paragraphStyle: paragraphStyle])
        let overviewAttributed = NSMutableAttributedString(string: movieModel.overview + "\n", attributes: [.font: Fonts.DetailOverviewController.overview, .paragraphStyle: paragraphStyle])
        attributedText.append(taglineAttributed)
        attributedText.append(headerAttributed)
        attributedText.append(overviewAttributed)
        
        for _ in 1...4 {
            if !arrayOfCrew.isEmpty {
                let crewName = NSMutableAttributedString(string: arrayOfCrew.first!.name + "\n", attributes: [.font: Fonts.DetailOverviewController.crewNamesFont, .paragraphStyle: paragraphStyle])
                let crewJob = NSMutableAttributedString(string: arrayOfCrew.first!.job + "\n", attributes: [.paragraphStyle: jobParagraphStyle])
                attributedText.append(crewName)
                attributedText.append(crewJob)
                arrayOfCrew.removeFirst()
            }
        }
        return attributedText
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        headerImage.snp.makeConstraints {
            $0.height.equalTo(200)
            $0.width.equalToSuperview()
        }
        
        posterImage.snp.makeConstraints {
            $0.leading.bottom.top.equalToSuperview().inset(20)
            $0.width.equalTo(90)
        }
        
        horizontalRatingButtonView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        ratingView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.height.width.equalTo(50)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.leading.equalTo(ratingView.snp.trailing).offset(10)
            $0.height.equalToSuperview()
        }
        
        playTrailerButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalToSuperview()
        }
        
        infoView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(100)
            $0.top.equalToSuperview().inset(10)
        }
        
        movieDurationLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel.snp.trailing).offset(10)
            $0.top.equalToSuperview().inset(10)
        }
        
        genres.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }

}
