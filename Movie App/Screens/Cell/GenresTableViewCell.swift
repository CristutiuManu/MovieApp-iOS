//
//  GenresTableViewCell.swift
//  Movie App
//
//  Created by Cristuțiu Emanuel on 12/10/2020.
//

import UIKit

class GenresTableViewCell: UITableViewCell {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet weak var genreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        genreButton.setTitle("Select", for: .normal)
        genreButton.setTitle("Selected", for: .selected)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "GenresTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "GenresTableViewCell",
                     bundle: nil)
    }
    
    func configure(with model: GenreItem) {
        self.nameLabel.text = model.genre.name
        genreButton.isSelected = model.isSelected
        }
}
