//
//  MovieCellModel.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 10.03.2022.
//

import Foundation

struct MovieCellModel {
    let rating: Int
    let image: String
    let backgroundImage: String
    let movieName: String
    let movieDate: String
    let id: Int
    var isSeen: Bool = false

    init(model: MovieDataResult) {
        self.rating = Int(model.voteAverage * 10)
        self.movieName = model.title
        self.image = model.posterPath
        self.movieDate = model.releaseDate
        self.id = model.id
        self.backgroundImage = model.backdropPath ?? ""
    }
    
    func getLink() -> URL? {
        URL(string: String(format: Links.imageLink, image))
    }

}
