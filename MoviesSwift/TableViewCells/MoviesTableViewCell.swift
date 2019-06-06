//
//  MoviesTableViewCell.swift
//  MoviesSwift
//
//  Created by Haroldo Leite on 04/03/2019.
//  Copyright © 2019 holiverleite. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var backgroundCardView: UIView! {
        didSet {
            self.backgroundCardView.layer.cornerRadius = 8.0
            self.backgroundCardView.backgroundColor = UIColor.white
            CALayer.setDropShadow(layer: self.backgroundCardView.layer, radius: 4, opacity: 0.9)
        }
    }
    @IBOutlet weak var moviesPoster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        }
    }
    
    @IBOutlet weak var launchYearLabel: UILabel! {
        didSet {
            self.launchYearLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        }
    }
    
    @IBOutlet weak var genresLabel: UILabel! {
        didSet {
            self.genresLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        }
    }
    
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView! {
        didSet {
            self.imageActivityIndicator.hidesWhenStopped = true
            self.imageActivityIndicator.startAnimating()
        }
    }
    
    //MARK: - Methods
    func setUpCell(movie: Movie) {
        var genders: String = ""
        self.titleLabel.text = movie.title
        self.launchYearLabel.text = "Launch Year: \(movie.releaseDate.prefix(4))"
        for gender in movie.genres {
            //Tratamento para não inserir gêneros repetidos
            if (!genders.contains(gender)) {
                genders += gender
                genders += ", "
            }
        }
        genders = String(genders.dropLast(2))
        self.genresLabel.text = genders
        if let image = movie.image {
            self.moviesPoster.image = image
        } else {
            self.moviesPoster.image = UIImage(named: "movie_placeholder")
        }
        self.imageActivityIndicator.stopAnimating()
    }
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
