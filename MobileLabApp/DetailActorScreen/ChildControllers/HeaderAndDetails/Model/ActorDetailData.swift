//
//  ActorDetailData.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 06.04.2022.
//

import Foundation

struct ActorDetailData: Decodable {
    let adult: Bool
    let alsoKnownAs: [String]
    let biography: String
    let birthday: String
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let placeOfBirth: String
    let popularity: Double
    let profilePath: String
    
    var linkImage: URL? {
        get {
            URL(string: String(format: Links.imageLink, profilePath))
        }
    }

    var genderString: String {
        get {
            if gender == 1 {
                return Strings.HeaderActorsController.female
            } else {
                return Strings.HeaderActorsController.male
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case alsoKnownAs = "also_known_as"
        case biography
        case birthday
        case gender
        case id
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
    }
}
