//
//  ItemDetailViewController.swift
//  pokemondex
//
//  Created by LTT on 8/21/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class ItemDetailViewController: BaseDetailViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var effectsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackgroundColor(fromHexString: "84E090", toHexString: "75DEDD")
        setRoundCornerView(contentView)
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }


}
