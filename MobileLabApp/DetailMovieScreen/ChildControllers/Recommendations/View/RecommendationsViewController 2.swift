//
//  RecommendationsViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 01.04.2022.
//

import UIKit

class RecommendationsViewController: UIViewController {
    
    var rootView: RecommendationsView {
        self.view as! RecommendationsView
    }
    
    var dataSource = [RecommendationDataResult]()
    
    var viewModel: RecommendationsViewModel?
    var id: Int!
    
    weak var delegate: PresentDetailScreenContainerDelegate?
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = RecommendationsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.getRecommendationsData()
        viewModel?.dataSourceHandler = { [weak self] data in
            guard let self = self else { return }
            self.dataSource = data
            self.rootView.recommendationsCollectionView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel?.dataSourceHandler = nil
    }
    
    private func setup() {
        rootView.recommendationsCollectionView.dataSource = self
        rootView.recommendationsCollectionView.delegate = self
        let viewModel = RecommendationsViewModel(id: id)
        self.viewModel = viewModel
    }
}
