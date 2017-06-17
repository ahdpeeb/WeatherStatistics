//
//  RightArrowButton.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 3/21/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

class UpDownButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setImageForStates()
    }
    
    private func setImageForStates() {
        self.setImage(UIImage(named: "up-arrow"), for: .selected)
        self.setImage(UIImage(named: "down-arrow"), for: .normal)
    }
}
