//
//  MediaViewController+Delegate+DataSource.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 30.03.2022.
//

import UIKit

extension MediaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch rootView.kindOfcell {
        case .poster:
            return posterDataSource.count
        case .backdrop:
            return backdropDataSource.count
        case .video:
            return videoDataSource.count
        case .mostPopular:
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch rootView.kindOfcell {
        case .poster:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as! PosterCollectionViewCell
            cell.updateCell(model: posterDataSource[indexPath.row])
            
            return cell
        case .backdrop:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackdropCollectionViewCell.identifier, for: indexPath) as! BackdropCollectionViewCell
            cell.updateCell(model: backdropDataSource[indexPath.row])
            
            return cell
        case .video:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as! VideoCollectionViewCell
            cell.updateCell(model: videoDataSource[indexPath.row])
            cell.buttonTapped = { [weak self] in
                guard let self = self else { return }
                let id = self.videoDataSource[indexPath.row].key
                self.delegate?.presentPlayerController(id: id)
            }
            
            return cell
        case .mostPopular:
            return cellForIndex(indexPath: indexPath, collectionView: collectionView)
    }
    }
}

extension MediaViewController: UICollectionViewDelegate {
    
}

extension MediaViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch rootView.kindOfcell {
        case .poster:
            return CGSize(width: 160, height: 310)
        case .backdrop, .video:
            return CGSize(width: 320, height: 180)
        case .mostPopular:
            switch indexPath.row {
            case 0, 1:
                return CGSize(width: 320, height: 180)
            default:
                return CGSize(width: 160, height: 310)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
