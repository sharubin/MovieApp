//
//  TopBilledCastViewController+Delegate+DataSource.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 29.03.2022.
//

import UIKit

extension TopBilledCastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBilledCastCollectionViewCell.identifier, for: indexPath) as! TopBilledCastCollectionViewCell
        cell.updateCell(actor: self.dataSource[indexPath.row])
        
        return cell
    }
}

extension TopBilledCastViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.presentActorDetailScreenContainerDelegate(id: dataSource[indexPath.row].id)
    }
}

extension TopBilledCastViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 160, height: 310)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
