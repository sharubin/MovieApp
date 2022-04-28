//
//  BackdropCollectionViewCell.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 31.03.2022.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    var buttonTapped: (() -> Void)?
    
    let imageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
    }
    
    let playButton = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "play-1"), for: .normal)
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
        imageView.addSubview(playButton)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        setNeedsUpdateConstraints()
    }
    
    @objc func playButtonTapped() {
        buttonTapped?()
    }
    
    func updateCell(model: VideoDataResults) {
        imageView.kf.setImage(with: model.linkImage)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        playButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(140)
            $0.top.bottom.equalToSuperview().inset(70)
        }
    }
}
