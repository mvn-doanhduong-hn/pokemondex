//
//  NibView.swift
//  pokemondex
//
//  Created by MacMini2012 on 8/8/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import UIKit

class NibView: UIView {
    
    var view : UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
    }
    
    func xibSetUp() {
        
    }
        
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return UIView()
        }
        return view
    }
}
