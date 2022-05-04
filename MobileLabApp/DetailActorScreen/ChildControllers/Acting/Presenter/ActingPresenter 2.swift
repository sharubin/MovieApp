//
//  ActingPresenter.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 16.04.2022.
//

import Foundation

protocol ActingPresenterProtocol: AnyObject {
    func getData()
}

class ActingPresenter {
    weak private var view: ActingViewProtocol?
    let repository: ActingRepositoryProtocol
    let id: Int

    init(id: Int, view: ActingViewProtocol, repository: ActingRepositoryProtocol = ActingRepository()) {
        self.view = view
        self.repository = repository
        self.id = id
    }
    
    private func transformToStruct(array: [CrewCastCellModel]) -> [YearAndArrayDataStruct] {
        var dictionary: [String : [CrewCastCellModel]] = [:]
        var resultStructArray = [YearAndArrayDataStruct]()
        for i in array {
            let year = cutYearFromDate(date: i.date)
            if let _ = dictionary[year] {
                dictionary[year]?.append(contentsOf: [i])
            } else {
                dictionary[year] = [i]
            }
        }
        let sortedDictionary = dictionary.sorted( by: { $0.0 > $1.0 })
        for (key, value) in sortedDictionary {
            resultStructArray.append(YearAndArrayDataStruct(year: key, arrayWithData: value))
        }
        
        return resultStructArray
    }
    
    private func cutYearFromDate(date: String?) -> String {
        var year = [Character]()
        var yearString = ""
        guard let date = date else { return yearString }
        for item in date where year.count < 4 {
            year.append(item)
        }
        yearString = String(year)
        
        return yearString
    }
}

extension ActingPresenter: ActingPresenterProtocol {
    func getData() {
        var allArray = [YearAndArrayDataStruct]()
        
        repository.getData(id: id) { result in
            switch result {
            case .success(let data):
                var arrayCast = [CrewCastCellModel]()
                var arrayCrew = [CrewCastCellModel]()
                data.cast.forEach { arrayCast.append(CrewCastCellModel(model: $0, type: .cast))}
                data.crew.forEach { arrayCrew.append(CrewCastCellModel(model: $0, type: .crew))}
                allArray = self.transformToStruct(array: arrayCast + arrayCrew)
                self.view?.setData(data: allArray)
            case .failure(let error):
                print(error)
            }
        }
    }
}
