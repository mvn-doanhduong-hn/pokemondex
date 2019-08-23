//
//  PokemonTableViewCell.swift
//  pokemondex
//
//  Created by LTT on 8/19/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonTypeStackView: UIStackView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setPokemonTypesView(pokemonTypes: [PokemonType]) {
        for subUIView in pokemonTypeStackView.arrangedSubviews as [UIView] {
            subUIView.removeFromSuperview()
        }
        
        for pokemonType in pokemonTypes {
            let name = pokemonType.image.lowercased()
            let image = UIImage(named: name)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            pokemonTypeStackView.addArrangedSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
}
