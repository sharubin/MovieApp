//
//  KnownForViewController+Delegate+DataSource.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.04.2022.
//

import UIKit

extension KnownForViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.presentDetailContainerController(id: dataSource[indexPath.row].id)
    }
}

extension KnownForViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KnownForCollectionViewCell.identifier, for: indexPath) as! KnownForCollectionViewCell
        cell.updateCell(data: dataSource[indexPath.row])
        
        return cell
    }
    
}

extension KnownForViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 160, height: 310)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}


