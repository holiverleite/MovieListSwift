//
//  Movie.swift
//  MoviesSwift
//
//  Created by Haroldo Leite on 04/03/2019.
//  Copyright © 2019 holiverleite. All rights reserved.
//

import UIKit
class Movie {
    let id: Int
    let voteAverage: Double
    let title: String
    var posterURL: String
    var image: UIImage?
    let genres: [String]
    let releaseDate: String
    
    struct movieKeys {
        static let id = "id"
        static let voteAverage = "vote_average"
        static let title = "title"
        static let posterURL = "poster_url"
        static let genres = "genres"
        static let releaseDate = "release_date"
    }
    
    init?(movieDictionary: [String : Any]) {
        guard let id = movieDictionary[movieKeys.id] as? Int, let voteAverage = movieDictionary[movieKeys.voteAverage] as? Double, let title = movieDictionary[movieKeys.title] as? String, let posterURL = movieDictionary[movieKeys.posterURL] as? String, let genres = movieDictionary[movieKeys.genres] as? [String], let releaseDate = movieDictionary[movieKeys.releaseDate] as? String else {
            return nil
        }
        self.id = id
        self.voteAverage = voteAverage
        self.title = title
        self.posterURL = posterURL
        self.genres = genres
        self.releaseDate = releaseDate
    }
    
    func downloadImage() {
        AlamofireService.getImage(stringURL: self.posterURL) { (image) in
            if let image = image {
                self.image = image
                NotificationCenter.default.post(name: .ImageDownloaded, object: nil, userInfo: [NotificationKeys.movieId: self.id])
            }
        }
    }
}
