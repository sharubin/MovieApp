//
//  KnownForViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.04.2022.
//

import UIKit

protocol KnownForViewProtocol: AnyObject {
    func setData(data: [KnownForCast])
}

class KnownForViewController: UIViewController {
    
    var rootView: KnownForView {
        self.view as! KnownForView
    }
    
    var dataSource = [KnownForCast]()
    
    weak var delegate: PresentDetailScreenContainerDelegate?
    
    var presenter: KnownForPresenterProtocol!
    
    override func loadView() {
        super.loadView()
    
        self.view = KnownForView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.getData()
    }
    
    private func setup() {
        rootView.knownForCollectionView.dataSource = self
        rootView.knownForCollectionView.delegate = self
    }
}

extension KnownForViewController: KnownForViewProtocol {
    func setData(data: [KnownForCast]) {
        self.dataSource = data
        self.rootView.knownForCollectionView.reloadData()
    }
}
