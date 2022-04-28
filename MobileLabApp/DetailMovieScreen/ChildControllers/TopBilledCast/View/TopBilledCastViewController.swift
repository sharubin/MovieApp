//
//  TopBilledCastViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 29.03.2022.
//

import UIKit

protocol TopBilledCastViewProtocol: AnyObject {
    func setData(data: [Cast])
}

class TopBilledCastViewController: UIViewController {

    var rootView: TopBilledCastView {
        self.view as! TopBilledCastView
    }
    var dataSource = [Cast]()
    var presenter: TopBilledCastPresenterProtocol!
    weak var delegate: PresentActorDetailScreenContainerDelegate?
    
    override func loadView() {
        super.loadView()
    
        self.view = TopBilledCastView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.getCastData()
    }
    
    private func setup() {
        rootView.topBilledCastCollectionView.dataSource = self
        rootView.topBilledCastCollectionView.delegate = self
    }
}

extension TopBilledCastViewController: TopBilledCastViewProtocol {
    func setData(data: [Cast]) {
        dataSource = data
        rootView.topBilledCastCollectionView.reloadData()
    }
}
