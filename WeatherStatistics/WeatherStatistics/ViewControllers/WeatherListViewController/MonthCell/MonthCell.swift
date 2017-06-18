//
//  MenuCell.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 5/16/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

class MonthCell: UITableViewCell {
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var daysLabel: UILabel!
    @IBOutlet var sunnyHoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        self.isHidden = false
        monthLabel.text = nil
        maxTempLabel.text = nil
        minTempLabel.text = nil
    }
    
    public func fillWithMonthData(_ data: MonthStatistic) {
        monthLabel.text = data.month.map({ String($0) })  ??  "- - -"
        maxTempLabel.text = data.tmax.map({ String(format: "%.2f", $0) })  ?? "- - -"
        minTempLabel.text = data.tmin.map({ String(format: "%.2f", $0) })  ??  "- - -"
        daysLabel.text = data.days.map({ String(format: "%.0f", $0) })  ??  "- - -"
        sunnyHoursLabel.text = data.sunH.map({ String(format: "%.0f", $0) }) ??  "- - -"
    }
}
