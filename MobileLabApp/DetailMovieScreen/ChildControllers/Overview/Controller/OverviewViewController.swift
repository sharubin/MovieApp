//
//  OverviewViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.03.2022.
//

import UIKit

class OverviewViewController: UIViewController {
    
    var rootView: OverviewView {
        self.view as! OverviewView
    }
    private let repository: OverviewRepositoryProtocol
    var id: Int
    var dataSource: DetailMovieData!
    var crewData: CrewData?
    weak var delegate: PresentPlayerControllerDelegate?
   
    init(repository: OverviewRepositoryProtocol = OverviewRepository(), id: Int) {
        self.id = id
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
    
        self.view = OverviewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        let group = DispatchGroup()
        group.enter()
        repository.getMovieData(id: id) { result in
            switch result {
            case .success(let data):
                self.dataSource = data
            case .failure(let error):
                print(error)
            }
            group.leave()
        }
        
        group.enter()
        self.repository.getCrewData(id: self.id) { result in
            switch result {
            case .success(let data):
                self.crewData = data
            case .failure(let error):
                print(error)
            }
            group.leave()
        }
       
        group.notify(queue: .main) {
            guard let crewData = self.crewData else { return }
            self.rootView.updatePage(movieModel: self.dataSource, crewModel: crewData)
        }
    }
        
    private func setup() {
        rootView.playTrailerButton.addTarget(self, action: #selector(buttonPlayTrailerTapped), for: .primaryActionTriggered)
        }
    
    @objc private func buttonPlayTrailerTapped() {
        repository.getVideoData(id: id) { result in
            switch result {
            case .success(let data):
                guard let key = data.results.first?.key else { return }
                self.delegate?.presentPlayerController(id: key)
            case .failure(let error):
                print(error)
            }
        }
    }
}
