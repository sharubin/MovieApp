//
//  Structs.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 11.03.2022.
//

import UIKit

struct APIResourses {
    struct APIClient {
        static let apiKey = "5aa3960cac883a3b943e4c337fdb0ae7"
    }
}

struct Colors {
    struct CategoryCollectionController {
        static let white = UIColor.white
        static let black = UIColor.black
        static let gray = UIColor.gray
    }
    
    struct MovieCell {
        static let green = UIColor.green
        static let yellow = UIColor.yellow
        static let red = UIColor.red
        static let black = UIColor.black
        static let white = UIColor.white
    }
    
    struct TrailersCollectionController {
        static let white = UIColor.white
        static let black = UIColor.black
    }
    
    struct DetailOverviewController {
        static let lightGray = UIColor(red: 230/255, green: 230/255, blue: 228/255, alpha: 1)
        static let darkGray = UIColor(red: 206/255, green: 206/255, blue: 204/255, alpha: 1)
        static let white = UIColor.white
        static let black = UIColor.black
    }
    
    struct MediaController {
        static let white = UIColor.white
        static let black = UIColor.black
    }
    
    struct RecommendationsController {
        static let white = UIColor.white
        static let black = UIColor.black
    }
    
    struct HeaderActorsController {
        static let blue = UIColor.blue
        static let black = UIColor.black
    }
    
    struct KnownForController {
        static let blue = UIColor.blue
        static let black = UIColor.black
    }
    
    struct ActingController {
        static let blue = UIColor.blue
        static let black = UIColor.black
        static let gray = UIColor.gray
    }
    
    struct TabBarController {
        static let black = UIColor.black
    }
}

struct Fonts {
    struct CategoryCollectionController {
        static let categoryFont = UIFont.systemFont(ofSize: 28, weight: .bold)
    }
    
    struct MovieCell {
        static let nameBoldFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        static let nameLightFont = UIFont.systemFont(ofSize: 17, weight: .light)
    }
    
    struct TrailersCollectionController {
        static let nameBoldFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        static let nameLightFont = UIFont.systemFont(ofSize: 17, weight: .light)
        static let categoryFont = UIFont.systemFont(ofSize: 28, weight: .bold)
        static let movieNameFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    struct ActorsController {
        static let cellNameFont = UIFont.systemFont(ofSize: 22)
        static let cellNumberFont = UIFont.systemFont(ofSize: 19)
    }
    
    struct DetailOverviewController {
        static let crewNamesFont = UIFont.boldSystemFont(ofSize: 20)
        static let header = UIFont.boldSystemFont(ofSize: 25)
        static let tagline = UIFont.italicSystemFont(ofSize: 20)
        static let overview = UIFont.systemFont(ofSize: 20)
    }
    
    struct MediaController {
        static let fontButton = UIFont.systemFont(ofSize: 12, weight: .bold)
        static let categoryFont = UIFont.systemFont(ofSize: 28, weight: .bold)
    }
    
    struct RecommendationsController {
        static let categoryFont = UIFont.systemFont(ofSize: 28, weight: .bold)
    }
    
    struct HeaderActorsController {
        static let categoryFont = UIFont.systemFont(ofSize: 28, weight: .bold)
    }
    
    struct KnownForController {
        static let categoryFont = UIFont.systemFont(ofSize: 28, weight: .bold)
    }
    
    struct ActingController {
        static let categoryFont = UIFont.systemFont(ofSize: 28, weight: .bold)
        static let dropDownFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
        static let cellFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        static let boldForAttributtedString = UIFont.boldSystemFont(ofSize: 20)
        static let usualFont = UIFont.systemFont(ofSize: 17)
    }
    
    struct TabBarController {
        static let light = UIFont.systemFont(ofSize: 17, weight: .ultraLight)
    }
}

struct Strings {
    
    struct TrailersCollectionController {
        static let trailers = "Latest trailers"
    }
    
    struct ActorsController {
        static let header = "Popular Actors"
    }
    
    struct DetailOverviewController {
        static let date = "%@ •"
        static let duration = "%d minutes"
        static let overview = "Overview"
        static let userScore = "User Score"
        static let playButton = " Play trailler"
    }
    
    struct DetailTopBilledCastController {
        static let header = "Top Billed Cast"
    }
    
    struct MediaController {
        static let header = "Media"
        static let poster = "POSTER"
        static let backdrop = "BACKDROPS"
        static let video = "VIDEO"
        static let mostPopular = "MOST POPULAR"
    }
    
    struct RecommendationsController {
        static let header = "Recommendations"
    }
    
    struct HeaderActorsController {
        static let buttonText = "Read more"
        static let selectedButtonText = "Hide"
        static let header = "Personal Info"
        static let knownForHeader = "Known For"
        static let genderHeader = "Gender"
        static let birthdayHeader = "Birthday"
        static let placeOfBirthHeader = "Place of Birth"
        static let biographyHeader = "Biography"
        static let male = "Male"
        static let female = "Female"
    }
    
    struct KnownForController {
        static let header = "Known for"
    }
    
    struct ActingController {
        static let header = "Acting"
        static let asString = "as "
        static let space = " "
        static let noInfo = "no information"
    }
    
    struct TabBarController {
        static let home = "Home"
        static let discover = "Discover"
    }
}

struct Links {
    static let imageLink = "https://image.tmdb.org/t/p/w500%@"
    static let videoLink = "https://www.youtube.com/watch?v=%d"
    static let imageLinkFromYoutube = "https://img.youtube.com/vi/%@/mqdefault.jpg"
    static let instagramLink = "https://www.instagram.com/%@"
    static let twitterLink = "https://twitter.com/%@"
}
