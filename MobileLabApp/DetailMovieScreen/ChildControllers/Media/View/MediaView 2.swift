//
//  MediaView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 30.03.2022.
//

import UIKit
import Then
import SnapKit

class MediaView: UIView {
    
    var kindOfcell = TypeOfCell.mostPopular
    
    private let headingView = UIView()
    
    private let headingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.MediaController.black
        $0.font = Fonts.MediaController.categoryFont
        $0.text = Strings.MediaController.header
    }
    
    private let posterButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        let myNormalAttributedTitle = NSMutableAttributedString(string: Strings.MediaController.poster)
        $0.setAttributedTitle(myNormalAttributedTitle, for: .normal)
        $0.setTitleColor(Colors.MediaController.black, for: .normal)
        $0.titleLabel?.font = Fonts.MediaController.fontButton
        let mySelectedAttributedTitle = NSMutableAttributedString(string: Strings.MediaController.poster, attributes: [.underlineStyle: NSUnderlineStyle.thick.rawValue, .underlineColor: Colors.MediaController.black])
        $0.setAttributedTitle(mySelectedAttributedTitle, for: .selected)
        $0.tag = TypeOfCell.poster.rawValue
    }
    
    private let backdropButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        let myNormalAttributedTitle = NSMutableAttributedString(string: Strings.MediaController.backdrop)
        $0.setAttributedTitle(myNormalAttributedTitle, for: .normal)
        $0.titleLabel?.font = Fonts.MediaController.fontButton
        let mySelectedAttributedTitle = NSMutableAttributedString(string: Strings.MediaController.backdrop, attributes: [.underlineStyle: NSUnderlineStyle.thick.rawValue, .underlineColor: Colors.MediaController.black])
        $0.setAttributedTitle(mySelectedAttributedTitle, for: .selected)
        $0.tag = TypeOfCell.backdrop.rawValue
    }
    
    private let videoButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        let myNormalAttributedTitle = NSMutableAttributedString(string: Strings.MediaController.video)
        $0.setAttributedTitle(myNormalAttributedTitle, for: .normal)
        $0.titleLabel?.font = Fonts.MediaController.fontButton
        let mySelectedAttributedTitle = NSMutableAttributedString(string: Strings.MediaController.video, attributes: [.underlineStyle: NSUnderlineStyle.thick.rawValue, .underlineColor: Colors.MediaController.black])
        $0.setAttributedTitle(mySelectedAttributedTitle, for: .selected)
        $0.tag = TypeOfCell.video.rawValue
    }
    
    private let mostPopularButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        let myNormalAttributedTitle = NSMutableAttributedString(string: Strings.MediaController.mostPopular)
        $0.setAttributedTitle(myNormalAttributedTitle, for: .normal)
        $0.titleLabel?.font = Fonts.MediaController.fontButton
        let mySelectedAttributedTitle = NSMutableAttributedString(string: Strings.MediaController.mostPopular, attributes: [.underlineStyle: NSUnderlineStyle.thick.rawValue, .underlineColor: Colors.MediaController.black])
        $0.setAttributedTitle(mySelectedAttributedTitle, for: .selected)
        $0.tag = TypeOfCell.mostPopular.rawValue
    }
    
    private let mediaCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 10
        $0.minimumLineSpacing = 10
    }
    
    lazy var mediaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: mediaCollectionViewFlowLayout).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        $0.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        $0.register(BackdropCollectionViewCell.self, forCellWithReuseIdentifier: BackdropCollectionViewCell.identifier)
        $0.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        addSubview(stack)
        stack.addArrangedSubview(headingView)
        headingView.addSubview(headingLabel)
        headingView.addSubview(posterButton)
        headingView.addSubview(backdropButton)
        headingView.addSubview(videoButton)
        headingView.addSubview(mostPopularButton)
        stack.addArrangedSubview(mediaCollectionView)
        setNeedsUpdateConstraints()
        posterButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        backdropButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        videoButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        mostPopularButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        mostPopularButton.isSelected = true
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        posterButton.isSelected = false
        backdropButton.isSelected = false
        videoButton.isSelected = false
        mostPopularButton.isSelected = false
        sender.isSelected = true
        guard let type = TypeOfCell(rawValue: sender.tag) else { return }
        kindOfcell = type
        mediaCollectionView.reloadData()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        headingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.bottom.equalToSuperview()
        }
        
        backdropButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview()
        }
        
        posterButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(130)
            $0.top.equalToSuperview()
        }
        
        mostPopularButton.snp.makeConstraints {
            $0.top.equalTo(backdropButton.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
        
        videoButton.snp.makeConstraints {
            $0.top.equalTo(posterButton.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(130)
            $0.bottom.equalToSuperview()
        }
        
        mediaCollectionView.snp.makeConstraints {
            $0.height.equalTo(340)
        }
    }
}
