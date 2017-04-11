//
//  Constants.swift
//  Ramotion Paper OnBoard
//
//  Created by Saransh Mittal on 24/03/17.
//  Copyright © 2017 Saransh Mittal. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    enum Asset: String {
        case logo = "logo"
        case Banks = ""
        case ready = "ready"
        case Key = "Key"
        case Shopping_Cart = "Shopping-cart"
        case Stores = "Stores"
        case Wallet = "Wallet"
        
        var image: UIImage {
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}
