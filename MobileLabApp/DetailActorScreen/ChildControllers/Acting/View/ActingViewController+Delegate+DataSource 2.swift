//
//  ActingViewController+Delegate+DataSource.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 12.04.2022.
//

import UIKit

extension ActingViewController: UITableViewDelegate {

}

extension ActingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return dataSource.count
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataSource[section].arrayWithData.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: ActingTableViewCell.identifier, for: indexPath) as! ActingTableViewCell
            cell.updateCell(model: dataSource[indexPath.section].arrayWithData[indexPath.row], year: dataSource[indexPath.section].year)
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = Colors.ActingController.gray
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        2
    }
}

extension ActingViewController: FillArrayDelegate {
    func fillArray(type: ActingTypeOfCell) {
        switch type {
        case .crew:
            filterData(type: .crew)
        case .cast:
            filterData(type: .cast)
        case .all:
            dataSource = allArray
        }
    }
}
