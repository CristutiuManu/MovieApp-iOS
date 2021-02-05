//
//  MoviesTableViewCell.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 19/10/2020.
//

import UIKit
import AlamofireImage

class MoviesTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    //@IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieTitle.lineBreakMode = .byTruncatingTail
        movieTitle.frame = CGRect(x: movieTitle.frame.origin.x, y: movieTitle.frame.origin.y, width: movieTitle.frame.width, height: movieTitle.optimalHeight)
        movieTitle.numberOfLines = 0
        //movieTitle.adjustsFontSizeToFitWidth = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        static let identifier = "MoviesTableViewCell"
   
        static func nib() -> UINib {
            return UINib(nibName: "MoviesTableViewCell",
                         bundle: nil)
        }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            movieImage.image = nil
        }

            func configure(with model: Movie) {
                self.movieTitle.text = model.title
                self.movieDate.text = model.releaseDate
               // self.movieDescription.text = model.overview??
                let urlString = "https://image.tmdb.org/t/p/original"
                let posterPath = model.posterPath ?? ""
                guard let url = URL(string: urlString + posterPath) else {
                    return
                }
                movieImage.af.setImage(withURL: url)
                
            }
    }

extension UILabel {
    var optimalHeight: CGFloat {
        get {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = self.font
            label.text = self.text
            label.sizeToFit()
            return label.frame.height
        }
    }
}

