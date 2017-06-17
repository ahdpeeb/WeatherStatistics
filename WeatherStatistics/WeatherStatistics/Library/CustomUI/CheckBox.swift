//
//  CheckBox.swift
//  DigitalBank
//
//  Created by iosDeveloper on 12/6/16.
//  Copyright © 2016 iosDeveloper. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    // Images
    let checkedImage = UIImage(named: "checked-circle")! as UIImage
    let uncheckedImage = UIImage(named: "empty-circle")! as UIImage
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.imageView?.image = checkedImage
                self.setImage(checkedImage, for: .normal)
            } else {
                self.imageView?.image = uncheckedImage
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(CheckBox.checkButtonTapped(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    func checkButtonTapped(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }

}
