//
//  CityCell.swift
//  WeatherStatistics
//
//  Created by iosDeveloper on 6/14/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet var frameView: UIView!
    @IBOutlet var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewFrameCustomization()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func viewFrameCustomization() {
        guard let frameLeyer = self.frameView?.layer else { return }

        frameLeyer.cornerRadius = 2.0
        frameLeyer.shadowColor = UIColor.lightGray.cgColor
        frameLeyer.shadowOpacity = 0.5
        frameLeyer.shadowOffset = CGSize.zero
        frameLeyer.shadowRadius = 3
        
        frameLeyer.masksToBounds = false
    }
    
    
}
