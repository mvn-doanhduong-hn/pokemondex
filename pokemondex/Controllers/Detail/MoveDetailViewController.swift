//
//  MoveDetailViewController.swift
//  pokemondex
//
//  Created by LTT on 8/21/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class MoveDetailViewController: BaseDetailViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeWithTextImageView: UIImageView!    
    @IBOutlet weak var effectsLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var ppLabel: UILabel!
    
    private var service: AlamofireMoveService!
    var move: Move!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackgroundColor(fromHexString: "559EDF", toHexString: "69B9E3")
        setRoundCornerView(contentView)
        
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        service = AlamofireMoveService(context: context)
        
        fetchResults(for: move.name)
    }

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
    func fetchResults(for text: String) {
        service.getMove(name: text, completion: { (move, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            self.typeImageView.image = UIImage(named: (move?.type.image.lowercased())!)
            self.typeWithTextImageView.image = UIImage(named: (move?.type.imageWithText.lowercased())!)
            self.nameLabel.text = move?.name
            self.effectsLabel.text = move?.effects
            self.powerLabel.text = "\(move?.power ?? 0)"
            self.accuracyLabel.text = "\(move?.accuracy ?? 0)%"
            self.ppLabel.text = "\(move?.pp ?? 0)"
           
            let gradientColors = Utils.getGradientColors(pokemonType: move!.type)
            self.setBackgroundColor(fromColor: gradientColors[0], toColor: gradientColors[1])
        })
    }
    
}
