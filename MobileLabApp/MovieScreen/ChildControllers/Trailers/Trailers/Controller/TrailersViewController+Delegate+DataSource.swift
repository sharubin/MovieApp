//
//  TrailersViewController+Delegate+DataSource.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 14.03.2022.
//

import UIKit

extension TrailersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrailersCollectionViewCell.identifier, for: indexPath) as! TrailersCollectionViewCell
        cell.updateCell(model: dataSource[indexPath.row])
        cell.delegate = self
        cell.indexPath = indexPath.row
        cell.buttonTapped = { [weak self] in
            guard let self = self else { return }
            let id = self.dataSource[indexPath.row].videoId
            self.delegate?.presentPlayerController(id: id)
        }
        
        return cell
    }
}

extension TrailersViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in rootView.trailersCollectionView.visibleCells {
            let indexPath = rootView.trailersCollectionView.indexPath(for: cell)
            guard let indexPath = indexPath else { return }
            rootView.trailersCollectionView.backgroundView = getImage(index: indexPath.row)
        }
    }
}

extension TrailersViewController: TrailersCollectionViewCellDelegate {
    func presentShareSheet(index: Int) {
        let id = dataSource[index].videoId
        delegate?.presentShareSheetViewController(id: id)
    }
}

extension TrailersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: self.view.frame.width - 20, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
}
