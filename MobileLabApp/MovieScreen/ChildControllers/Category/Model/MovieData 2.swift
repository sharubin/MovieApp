
import Foundation

// MARK: - MovieData
struct MovieData: Codable {
    let results: [MovieDataResult]
}

// MARK: - Result
struct MovieDataResult: Codable {
    let id: Int
    let posterPath, releaseDate, title: String
    let backdropPath: String?
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}


