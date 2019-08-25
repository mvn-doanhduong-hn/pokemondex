//
//  UIScrollView+Extendsion.swift
//  pokemondex
//
//  Created by LTT on 8/24/19.
//  Copyright © 2019 Pokemondex. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    func updateContentView() {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
    }
}
