//
//  VideoCellModel.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 18.03.2022.
//

import Foundation

struct VideoCellModel {
    let movieName: String
    let image: String
    let videoId: String
    
    func getLinkBackground() -> URL? {
        URL(string: "https://image.tmdb.org/t/p/w500\(image)")
    }

}
