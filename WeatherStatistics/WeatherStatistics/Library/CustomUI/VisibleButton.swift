//
//  VisibleButton.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 2/16/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

class VisibleButton: UIButton {

    override func awakeFromNib() {
        self.initialConfig()
    }
    
    private func initialConfig() {
        self.setImage(UIImage(named: "setInvisible"), for: .selected)
        self.setImage(UIImage(named: "setVisible"), for: .normal)
    }
}
