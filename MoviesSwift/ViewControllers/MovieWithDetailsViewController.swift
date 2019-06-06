//
//  MovieWithDetailsViewController.swift
//  MoviesSwift
//
//  Created by Haroldo Leite on 05/03/2019.
//  Copyright © 2019 holiverleite. All rights reserved.
//

import UIKit

class MovieWithDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var moviePosterView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        }
    }
    
    @IBOutlet weak var yearLabel: UILabel! {
        didSet {
            self.yearLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        }
    }
    
    @IBOutlet weak var genresLabel: UILabel! {
        didSet {
            self.genresLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        }
    }
    
    @IBOutlet weak var overviewLabel: UILabel! {
        didSet {
            self.overviewLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        }
    }
    
    @IBOutlet weak var runtimeLabel: UILabel! {
        didSet {
            self.runtimeLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        }
    }
    
    @IBOutlet weak var revenueLabel: UILabel! {
        didSet {
            self.revenueLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        }
    }
    
    @IBOutlet weak var languagesLabel: UILabel! {
        didSet {
            self.languagesLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        }
    }
    
    @IBOutlet weak var originalTitleLabel: UILabel! {
        didSet {
            self.originalTitleLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        }
    }
    
    @IBOutlet weak var originalLanguageLabel: UILabel! {
        didSet {
            self.originalLanguageLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        }
    }
    
    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var moviesWithDetailsActivityIndicator: UIActivityIndicatorView! {
        didSet {
            self.moviesWithDetailsActivityIndicator.hidesWhenStopped = true
        }
    }
    
    @IBOutlet weak var noInternetView: UIView! {
        didSet {
            self.noInternetView.isHidden = true
        }
    }
    @IBOutlet weak var moviesDetailScrollView: UIScrollView!
    
    //MARK: - Variables
    var movie: MovieWithDetails? = nil
    var id: Int = 0
    var movieTitle: String = ""
    var moviePoster: UIImage? = nil
    var genres: [String] = []
    var year: String = ""
    lazy var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    //MARK: - Methods
    func getDetails() {
        self.moviesWithDetailsActivityIndicator.startAnimating()
        self.noInternetView.isHidden = true
        self.moviesDetailScrollView.isScrollEnabled = true
        AlamofireService.getMovieWithDetails(movieId: self.id) { (movieWithDetails) in
            guard let movieDetails = movieWithDetails else {
                self.noInternetView.isHidden = false
                self.moviesDetailScrollView.isScrollEnabled = false
                return
            }
            self.titleLabel.text = self.title
            self.overviewLabel.text = movieDetails.overview
            self.revenueLabel.text = String(format: String.localize("revenue_value"), self.currencyFormatter.string(from: NSNumber(value: movieDetails.revenue)) ?? "")
            self.runtimeLabel.text = String(format: String.localize("runtime_value"), movieDetails.runtime.description)
            self.languagesLabel.text = String(format: String.localize("languages"), movieDetails.spokenLanguages.joined(separator: ", "))
            self.originalTitleLabel.text = String(format: String.localize("original_title"), movieDetails.originalTitle)
            self.originalLanguageLabel.text = String(format: String.localize("original_language"), movieDetails.originalLanguage)
            self.moviesWithDetailsActivityIndicator.stopAnimating()
            self.loadingView.isHidden = true
        }
    }
    
    //MARK: - Listeners
    @objc func internetConnected() {
       getDetails()
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviePosterView.image = self.moviePoster
        self.yearLabel.text = String(format: String.localize("launch_year"), self.year.prefix(4) as CVarArg)
        self.genresLabel.text = String(format: String.localize("genre_movie"), self.genres.joined(separator: ", ")) 
        NotificationCenter.default.addObserver(self, selector: #selector(internetConnected), name: .InternetConnected, object: nil)
        self.getDetails()
    }
}
