//
//  ActorsTableViewCell.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 09/10/2020.
//

import UIKit
import AlamofireImage

class ActorsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageActor: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }

        static let identifier = "ActorsTableViewCell"

        static func nib() -> UINib {
            return UINib(nibName: "ActorsTableViewCell",
                         bundle: nil)
        }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageActor.image = nil 
    }

        func configure(with model: Actor) {
            self.nameLabel.text = model.name
            let urlString = "https://image.tmdb.org/t/p/original"
            let profilePath = model.profilePath ?? ""
            guard let url = URL(string: urlString + profilePath) else {
                return
            }
            imageActor.af.setImage(withURL: url)
            
        }

   
    
}
