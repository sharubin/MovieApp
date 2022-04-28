//
//  PlayerViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 15.03.2022.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var rootView: VideoView {
        self.view as! VideoView
    }
    let id: String!
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        
        self.view = VideoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        getVideo(id: id)
    }
    
    func getVideo(id: String) {
        rootView.playerView.load(withVideoId: id)
    }
}
