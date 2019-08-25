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
    
    private var service: AlamofireItemService!
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setBackgroundColor(fromHexString: "84E090", toHexString: "75DEDD")
        setRoundCornerView(contentView)
        
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        service = AlamofireItemService(context: context)
        
        fetchResults(for: item.name)
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }

    func fetchResults(for text: String) {
        service.getItem(name: text, completion: { (item, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
            
            self.itemImageView.af_setImage(withURL: URL(string: item!.image)!)
            self.itemNameLabel.text = item?.name
            self.itemPriceLabel.text = "\(item?.price ?? 0)"
            self.effectsLabel.text = item?.effects
        })
    }

}
