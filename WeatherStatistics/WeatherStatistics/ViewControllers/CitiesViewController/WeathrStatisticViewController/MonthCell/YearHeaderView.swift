//
//  SectionForTVC.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 2/1/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

class YearHeaderView: UITableViewHeaderFooterView {
    var menuButtonBlock: ((_ sender: UIButton) -> ())?
    var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet var menuButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addGestureRecognither()
        self.menuButton.setImage(UIImage(named: "arrow_bot_triangle"), for: UIControlState.normal)
        self.menuButton.setImage(UIImage(named: "arrow_up_triangle"), for: UIControlState.selected)
    }
    
    @IBAction func menuButtonAction(_ sender: UIButton) {
        self.menuButtonBlock.map { $0(sender) }
    }
    
    private func addGestureRecognither() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_ :)))
        self.tapGesture = gesture
        self.addGestureRecognizer(gesture)
    }
    
    func tapGestureAction(_ sender: UITapGestureRecognizer) {
        self.menuButtonAction(menuButton)
    }
}
