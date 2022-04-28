//
//  HeaderActorView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 06.04.2022.
//

import UIKit

class HeaderActorView: UIView {
    
    private let stack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    let headerImage = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let actorNameLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = Colors.HeaderActorsController.black
        $0.font = Fonts.HeaderActorsController.categoryFont
    }
    
    private let buttonsStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 5
    }
    
    let twitterButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "twitter"), for: .normal)
    }
    
    let instagramButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "instagram"), for: .normal)
    }
    
    let multilineLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 20
    }
    
    private let multilineLabelStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
        $0.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    let buttonView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let readMoreButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(Strings.HeaderActorsController.buttonText, for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.setTitle(Strings.HeaderActorsController.selectedButtonText, for: .selected)
        $0.setTitleColor(.blue, for: .selected)
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
        backgroundColor = .white
        addSubview(stack)
        stack.addArrangedSubview(headerImage)
        stack.addArrangedSubview(actorNameLabel)
        stack.addArrangedSubview(buttonsStack)
        buttonsStack.addArrangedSubview(twitterButton)
        buttonsStack.addArrangedSubview(instagramButton)
        stack.addArrangedSubview(multilineLabelStack)
        multilineLabelStack.addArrangedSubview(multilineLabel)
        stack.addArrangedSubview(buttonView)
        buttonView.addSubview(readMoreButton)
        readMoreButton.addTarget(self, action: #selector(readMoreButtonTapped), for: .primaryActionTriggered)
    }
    
    @objc private func readMoreButtonTapped() {
        if !readMoreButton.isSelected {
            multilineLabel.numberOfLines = 0
            readMoreButton.isSelected = true
        } else {
            multilineLabel.numberOfLines = 20
            readMoreButton.isSelected = false
        }
    }
    
    func updatePage(actorData: ActorDetailData) {
        headerImage.kf.setImage(with: actorData.linkImage)
        actorNameLabel.text = actorData.name
        multilineLabel.attributedText = createAttributedString(actorData: actorData)
    }
    
    func createAttributedString(actorData: ActorDetailData) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle().then {
            $0.firstLineHeadIndent = 0
            $0.paragraphSpacingBefore = 10.0
        }
        let jobParagraphStyle = NSMutableParagraphStyle().then {
            $0.firstLineHeadIndent = 0
            $0.paragraphSpacingBefore = 0
        }
        let attributedText = NSMutableAttributedString()
        let header = NSAttributedString(string: Strings.HeaderActorsController.header + "\n", attributes: [.font: Fonts.DetailOverviewController.header, .paragraphStyle: paragraphStyle])
        let knownForHeader = NSAttributedString(string: Strings.HeaderActorsController.knownForHeader + "\n", attributes: [.font: Fonts.DetailOverviewController.crewNamesFont, .paragraphStyle: paragraphStyle])
        let knownFor = NSAttributedString(string: actorData.knownForDepartment + "\n", attributes: [.paragraphStyle: jobParagraphStyle])
        let genderHeader = NSAttributedString(string: Strings.HeaderActorsController.genderHeader + "\n", attributes: [.font: Fonts.DetailOverviewController.crewNamesFont, .paragraphStyle: paragraphStyle])
        let gender = NSAttributedString(string: actorData.genderString + "\n", attributes: [.paragraphStyle: jobParagraphStyle])
        let birthdayHeader = NSAttributedString(string: Strings.HeaderActorsController.birthdayHeader + "\n", attributes: [.font: Fonts.DetailOverviewController.crewNamesFont, .paragraphStyle: paragraphStyle])
        let birthday = NSAttributedString(string: actorData.birthday + "\n", attributes: [.paragraphStyle: jobParagraphStyle])
        let placeOfBirthHeader = NSAttributedString(string: Strings.HeaderActorsController.placeOfBirthHeader + "\n", attributes: [.font: Fonts.DetailOverviewController.crewNamesFont, .paragraphStyle: paragraphStyle])
        let placeOfBirth = NSAttributedString(string: actorData.placeOfBirth + "\n", attributes: [.paragraphStyle: jobParagraphStyle])
        let biographyHeader = NSAttributedString(string: Strings.HeaderActorsController.biographyHeader + "\n", attributes: [.font: Fonts.DetailOverviewController.header, .paragraphStyle: paragraphStyle])
        let biography = NSAttributedString(string: actorData.biography, attributes: [.font: Fonts.DetailOverviewController.overview, .paragraphStyle: paragraphStyle])
        attributedText.append(header)
        attributedText.append(knownForHeader)
        attributedText.append(knownFor)
        attributedText.append(genderHeader)
        attributedText.append(gender)
        attributedText.append(birthdayHeader)
        attributedText.append(birthday)
        attributedText.append(placeOfBirthHeader)
        attributedText.append(placeOfBirth)
        attributedText.append(biographyHeader)
        attributedText.append(biography)
        
        return attributedText
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        headerImage.snp.makeConstraints {
            $0.height.width.equalTo(180)
        }
        
        buttonView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        readMoreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
