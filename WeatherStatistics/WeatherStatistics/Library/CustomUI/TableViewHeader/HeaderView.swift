//
//  HeaderView.swift
//  DigitalBank
//
//  Created by Misha Korchak on 29.05.17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
