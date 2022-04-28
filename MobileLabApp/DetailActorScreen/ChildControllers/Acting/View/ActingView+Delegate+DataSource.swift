//
//  ActingView+Delegate+DataSource.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 20.04.2022.
//

import UIKit

extension ActingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let type = ActingTypeOfCell(rawValue: typeArray[indexPath.row]) else { return }
        buttonDropDawnTapped()
        typeOfCell = type
        dropDawnButton.setTitle(typeArray[indexPath.row], for: .normal)
        delegate?.fillArray(type: type)
        actingTableView.reloadData()
    }
}

extension ActingView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        typeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DropDownTableViewCell.identifier, for: indexPath) as! DropDownTableViewCell
        cell.updateCell(model: typeArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 4

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}
