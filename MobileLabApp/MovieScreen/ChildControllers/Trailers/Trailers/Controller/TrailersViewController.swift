//
//  TrailersViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 14.03.2022.
//

import UIKit
import Kingfisher

protocol TrailersViewControllerDelegate: AnyObject {
    func presentPlayerController(id: String)
    func presentShareSheetViewController(id: String)
}

class TrailersViewController: UIViewController {

    var rootView: TrailersView {
        self.view as! TrailersView
    }
    private let repository: TrailersRepositoryProtocol
    var dataSource = [VideoCellModel]()
    weak var delegate: TrailersViewControllerDelegate?
    
    init(repository: TrailersRepositoryProtocol = TrailersRepository()) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        
        self.view = TrailersView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        repository.getData(category: Category.popular) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.dataSource = data
                self.rootView.trailersCollectionView.reloadData()
                self.rootView.trailersCollectionView.backgroundView = self.getImage(index: 0)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getImage(index: Int) -> UIImageView {
        let bgImage = UIImageView()
        bgImage.kf.setImage(with: URL(string: String(format: Links.imageLink, dataSource[index].image)))
        bgImage.contentMode = .scaleToFill
        bgImage.alpha = 0.7
        
        return bgImage
    }
    
    private func setup() {
        rootView.trailersCollectionView.dataSource = self
        rootView.trailersCollectionView.delegate = self
    }
    
}
