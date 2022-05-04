//
//  CrewCastCellModel.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 22.04.2022.
//

import Foundation

struct CrewCastCellModel: Equatable {
    let date: String?
    let job: String?
    let character: String?
    let title: String
    let type: ActingTypeOfCell
    
    init(model: ActingResult, type: ActingTypeOfCell) {
        self.date = model.releaseDate
        self.job = model.job
        self.character = model.character
        self.title = model.title
        self.type = type
    }
}
