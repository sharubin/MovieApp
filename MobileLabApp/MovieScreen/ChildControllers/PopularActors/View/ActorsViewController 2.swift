//
//  ActorsViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 21.03.2022.
//

import UIKit

protocol ActorsViewProtocol: AnyObject {
    func setData(data: [ActorInfo])
}

class ActorsViewController: UIViewController {
    
    var rootView: ActorsView {
        self.view as! ActorsView
    }
    
    private let repository: PopularActorRepositoryProtocol
    var dataSource = [ActorInfo]()
    var loaded: Bool { !dataSource.isEmpty }
    private var presenter: ActorsPresenterProtocol!
    weak var delegate: PresentActorDetailScreenContainerDelegate?
    
    init(repository: PopularActorRepositoryProtocol = PopularActorRepository()) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = ActorsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.getMovieData()
    }
    
    private func setup() {
        rootView.actorsTableView.dataSource = self
        rootView.actorsTableView.delegate = self
        presenter = ActorsPresenter(view: self)
    }
}

extension ActorsViewController: ActorsViewProtocol {
    func setData(data: [ActorInfo]) {
        dataSource = data
        rootView.actorsTableView.reloadData()
    }
}
