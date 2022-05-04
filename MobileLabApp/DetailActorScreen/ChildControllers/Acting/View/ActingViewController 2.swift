//
//  ActingViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 12.04.2022.
//

import UIKit

protocol ActingViewProtocol: AnyObject {
    func setData(data: [YearAndArrayDataStruct])
}

class ActingViewController: UIViewController {
    
    var rootView: ActingView {
        self.view as! ActingView
    }
    
    var presenter: ActingPresenterProtocol!

    var dataSource = [YearAndArrayDataStruct]()

    var allArray = [YearAndArrayDataStruct]()

    override func loadView() {
        super.loadView()
    
        self.view = ActingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.getData()
    }
    
    private func setup() {
        rootView.actingTableView.dataSource = self
        rootView.actingTableView.delegate = self
        rootView.delegate = self
    }
    
    func filterData(type: ActingTypeOfCell) {
        dataSource = allArray
        dataSource.indices.forEach { dataSource[$0].arrayWithData = dataSource[$0].arrayWithData.filter { $0.type == type } }
        var data = [YearAndArrayDataStruct]()
        dataSource.forEach { if !$0.arrayWithData.isEmpty { data.append($0)} }
        dataSource = data
    }
}

extension ActingViewController: ActingViewProtocol {
    func setData(data: [YearAndArrayDataStruct]) {
        allArray = data
        dataSource = data
        rootView.actingTableView.reloadData()
    }
}
