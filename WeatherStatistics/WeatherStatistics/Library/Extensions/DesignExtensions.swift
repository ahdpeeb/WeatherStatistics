//
//  DesignExtensions.swift
//  DigitalBank
//
//  Created by Misha Korchak on 08.06.17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation
import UIKit

// Color palette

extension UIColor {
    class var untBlack: UIColor {
        return UIColor(red: 32.0 / 255.0, green: 26.0 / 255.0, blue: 25.0 / 255.0, alpha: 1.0)
    }
}

// Text styles

extension UIFont {
    class func untTextStyleFont() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: 16.0)
    }
    
    class func untTextStyle2Font() -> UIFont? {
        return UIFont(name: "Roboto-Condensed", size: 16.0)
    }
    
    class func untTextStyle4Font() -> UIFont? {
        return UIFont(name: "Roboto-Light", size: 13.33)
    }
    
    class func untTextStyle3Font() -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: 12.0)
    }
}
