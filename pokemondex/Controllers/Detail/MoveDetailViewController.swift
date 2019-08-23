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
    @IBOutlet weak var typeStackView: UIStackView!
    @IBOutlet weak var effectsLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var ppLabel: UILabel!
    
    private var service: AlamofireMoveService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackgroundColor(fromHexString: "559EDF", toHexString: "69B9E3")
        setRoundCornerView(contentView)
        
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        service = AlamofireMoveService(context: context)
        
        fetchResults(for: "Absorb")
    }

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
    func fetchResults(for text: String) {
        service.getMove(name: text, completion: { (move, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            print("Name \(String(describing: move?.name))")
            
        })
    }
    
}
