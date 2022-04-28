//
//  DiscoverViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 25.04.2022.
//

import UIKit

protocol DiscoverViewProtocol: AnyObject {
    func setData(data: [DiscoverResult])
}

class DiscoverViewController: UIViewController {

    var rootView: DiscoverView {
        self.view as! DiscoverView
    }
    
    var dataSource = [DiscoverResult]()
    
    var presenter: DiscoverPresenterProtocol!
    
    override func loadView() {
        super.loadView()
        
        self.view = DiscoverView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.getData()
    }
    
    private func setup() {
        rootView.discoverCollectionView.dataSource = self
        rootView.discoverCollectionView.delegate = self
    }
    
    func presentDetailContainerController(id: Int) {
        let detailController = DetailContainerViewController(id: id)
        detailController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}

extension DiscoverViewController: DiscoverViewProtocol {
    func setData(data: [DiscoverResult]) {
        self.dataSource.append(contentsOf: data)
        DispatchQueue.main.async {
            self.rootView.discoverCollectionView.reloadData()
        }
    }
}
