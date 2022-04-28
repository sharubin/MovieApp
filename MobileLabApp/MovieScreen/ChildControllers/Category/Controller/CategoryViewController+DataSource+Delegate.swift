//
//  CategoryViewController+DataSource+Delegate.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.03.2022.
//

import UIKit

extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if loaded {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
            cell.updateCell(movie: self.dataSource[indexPath.row])
            self.dataSource[indexPath.row].isSeen = true
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkeletonCategoryCollectionViewCell.identifier, for: indexPath) as! SkeletonCategoryCollectionViewCell
            cell.startShimmeringAnimation(view: collectionView)
            
            return cell
        }
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.presentDetailContainerController(id: dataSource[indexPath.row].id)
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 160, height: 290)
    }
}
