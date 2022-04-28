//
//  MediaViewController.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 30.03.2022.
//

import UIKit

protocol MediaViewProtocol: AnyObject {
    func setVideoData(videoData: [VideoDataResults])
    func setImageData(imageData: MediaImageData)
}

class MediaViewController: UIViewController {
    
    var rootView: MediaView {
        self.view as! MediaView
    }
    
    var posterDataSource = [MediaImage]()
    
    var backdropDataSource = [MediaImage]()
    
    var videoDataSource = [VideoDataResults]()
    
    weak var delegate: PresentPlayerControllerDelegate?
    
    var presenter: MediaPresenterProtocol!
    
    override func loadView() {
        super.loadView()
        
        self.view = MediaView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.getData()
    }
    
    private func setup() {
        rootView.mediaCollectionView.dataSource = self
        rootView.mediaCollectionView.delegate = self
    }
    
    func cellForIndex(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as! VideoCollectionViewCell
            if !videoDataSource.isEmpty {
                cell.updateCell(model: videoDataSource.first!)
            }
            cell.buttonTapped = { [weak self] in
                guard let self = self else { return }
                guard let id = self.videoDataSource.first?.key else { return }
                self.delegate?.presentPlayerController(id: id)
            }
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackdropCollectionViewCell.identifier, for: indexPath) as! BackdropCollectionViewCell
            let sortedArray = backdropDataSource.sorted { $0.voteAverage > $1.voteAverage }
            if !sortedArray.isEmpty {
                cell.updateCell(model: sortedArray.first!)
            }
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as! PosterCollectionViewCell
            let sortedArray = posterDataSource.sorted { $0.voteAverage > $1.voteAverage }
            if !sortedArray.isEmpty {
                cell.updateCell(model: sortedArray.first!)
            }
            
            return cell
        }
    }
}

extension MediaViewController: MediaViewProtocol {
    func setVideoData(videoData: [VideoDataResults]) {
        self.videoDataSource = videoData
        self.rootView.mediaCollectionView.reloadData()
    }
    
    func setImageData(imageData: MediaImageData) {
        self.posterDataSource = imageData.posters
        self.backdropDataSource = imageData.backdrops
        self.rootView.mediaCollectionView.reloadData()
    }
}
