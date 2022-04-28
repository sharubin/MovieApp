//
//  TrailersCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 14.03.2022.
//

import UIKit
import Then
import SnapKit

protocol TrailersCollectionViewCellDelegate: AnyObject {
    func presentShareSheet(index: Int)
}

class TrailersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TrailersCollectionViewCell"
    
    weak var delegate: TrailersCollectionViewCellDelegate?
    var buttonTapped: (()->Void)?
    private let movieNameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.TrailersCollectionController.white
        $0.font = Fonts.TrailersCollectionController.movieNameFont
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
     let imageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
    }
    
    let playButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "play"), for: .normal)
    }
    
    let shareButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "share"), for: .normal)
    }
    
    var indexPath: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        setNeedsUpdateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(imageView)
        contentView.addSubview(movieNameLabel)
        imageView.addSubview(playButton)
        imageView.addSubview(shareButton)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(presentShareSheet), for: .touchUpInside)
    }
    
    @objc func playButtonTapped() {
        buttonTapped?()
    }
    
    @objc func presentShareSheet() {
        delegate?.presentShareSheet(index: indexPath!)
    }
    
    func updateCell(model: VideoCellModel) {
        movieNameLabel.text = model.movieName
        imageView.kf.setImage(with: model.getLinkBackground())
    }

    override func updateConstraints() {
        super.updateConstraints()

        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(10)
        }
        
        playButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65)
            $0.width.equalTo(70)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().inset(150)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(25)
        }
    }
}
