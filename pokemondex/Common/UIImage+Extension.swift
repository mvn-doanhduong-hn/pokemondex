//
//  UIImageView+Extension.swift
//  pokemondex
//
//  Created by LTT on 8/25/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        
        if let pixelData = self.cgImage?.dataProvider?.data {
            let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
            
            let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
            
            let r = CGFloat(data[pixelInfo+0]) / CGFloat(255.0)
            let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
            let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
            let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
            
            return UIColor(red: b, green: g, blue: r, alpha: a)
        } else {
            //IF something is wrong I returned WHITE, but change as needed
            return UIColor.white
        }
    }
    
    
}
