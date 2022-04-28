//
//  VideoView.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 15.03.2022.
//

import UIKit
import youtube_ios_player_helper

class VideoView: UIView {

    let playerView = YTPlayerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(playerView)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        playerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }


}
