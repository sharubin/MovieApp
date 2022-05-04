//
//  CategotyViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 03.03.2022.
//

import UIKit

class CategoryViewController: UIViewController {

    var rootView: CategoryScreenView {
        self.view as! CategoryScreenView
    }
    private var category: Category
    private let repository: MovieScreenRepositoryProtocol
    var loaded: Bool { !dataSource.isEmpty }
    var dataSource = [MovieCellModel]()
    weak var delegate: PresentDetailScreenContainerDelegate?
   
    init(repository: MovieScreenRepositoryProtocol = MovieScreenRepository(), category: Category) {
        self.repository = repository
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
    
        self.view = CategoryScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        rootView.updateCategory(category: category)
        repository.getData(category: category) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.dataSource = data
                self.rootView.movieCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setup() {
        rootView.movieCollectionView.dataSource = self
        rootView.movieCollectionView.delegate = self
    }
}
