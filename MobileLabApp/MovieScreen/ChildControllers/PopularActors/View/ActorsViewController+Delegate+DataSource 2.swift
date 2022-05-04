//
//  ActorsViewController+Delegate+DataSource.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 21.03.2022.
//

import UIKit

extension ActorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if loaded {
            let cell = tableView.dequeueReusableCell(withIdentifier: ActorsTableViewCell.identifier, for: indexPath) as! ActorsTableViewCell
            cell.updateCell(model: dataSource[indexPath.row])
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonTableViewCell.identifier, for: indexPath) as! SkeletonTableViewCell
            cell.startShimmeringAnimation(view: tableView)
            
            return cell
        }
    }
    
}

extension ActorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.presentActorDetailScreenContainerDelegate(id: dataSource[indexPath.row].id)
    }
}
