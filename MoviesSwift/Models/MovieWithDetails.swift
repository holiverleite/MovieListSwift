//
//  MovieWithDetails.swift
//  MoviesSwift
//
//  Created by Haroldo Leite on 04/03/2019.
//  Copyright © 2019 holiverleite. All rights reserved.
//

import UIKit
class MovieWithDetails {
    let budget: Int64
    let genres: [String]
    let homepage: String?
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let revenue: Int64
    let runtime: Int
    let spokenLanguages: [String]
    let tagline: String
    let title: String
    let voteAverage: Double
    
    struct movieWithDetailsKeys {
        static let budget = "budget"
        static let genres = "genres"
        static let homepage = "homepage"
        static let id = "id"
        static let originalLanguage = "original_language"
        static let originalTitle = "original_title"
        static let overview = "overview"
        static let releaseDate = "release_date"
        static let revenue = "revenue"
        static let runtime = "runtime"
        static let spokenLanguages = "spoken_languages"
        static let tagline = "tagline"
        static let title = "title"
        static let voteAverage = "vote_average"
    }
    
    init?(movieWithDetailsDictionary: [String : Any]) {
        guard let id = movieWithDetailsDictionary[movieWithDetailsKeys.id] as? Int,
            let genres = movieWithDetailsDictionary[movieWithDetailsKeys.genres] as? [String],
            let originalLanguage = movieWithDetailsDictionary[movieWithDetailsKeys.originalLanguage] as? String,
            let originalTitle = movieWithDetailsDictionary[movieWithDetailsKeys.originalTitle] as? String,
            let overview = movieWithDetailsDictionary[movieWithDetailsKeys.overview] as? String,
            let releaseDate = movieWithDetailsDictionary[movieWithDetailsKeys.releaseDate] as? String,
            let revenue = movieWithDetailsDictionary[movieWithDetailsKeys.revenue] as? Int64,
            let runtime = movieWithDetailsDictionary[movieWithDetailsKeys.runtime] as? Int,
            let spokenLanguagesDict = movieWithDetailsDictionary[movieWithDetailsKeys.spokenLanguages] as? [[String : Any]],
            let tagline = movieWithDetailsDictionary[movieWithDetailsKeys.tagline] as? String,
            let voteAverage = movieWithDetailsDictionary[movieWithDetailsKeys.voteAverage] as? Double,
            let budget = movieWithDetailsDictionary[movieWithDetailsKeys.budget] as? Int64,
            let title = movieWithDetailsDictionary[movieWithDetailsKeys.title] as? String else {
            return nil
        }
        self.budget = budget
        self.genres = genres
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguagesDict.compactMap { (spokenDict) -> String? in
            return spokenDict["name"] as? String
        }
        self.tagline = tagline
        self.title = title
        self.voteAverage = voteAverage
        self.homepage = movieWithDetailsDictionary[movieWithDetailsKeys.homepage] as? String
    }
}


