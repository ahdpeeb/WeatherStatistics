//
//  CreditProgressView.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 5/12/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

class CreditProgressView: UIView {
    public var indicatorColor = UIColor.green {
        didSet {
            self.progressView.backgroundColor = indicatorColor
        }
    }
    
    public var title: String = "" {
        didSet {
            self.textLabel.text = title
        }
    }
    
    public let initialValue: CGFloat = 0;
    public var finalValue: CGFloat = 0;
    public var currentValue: CGFloat = 0 {
        didSet{
            self.setProgressPosition()
        }
    }
    
    private (set) var progressView: UIView!
    private (set) var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.progressView = UIView(frame: self.bounds)
        self.textLabel = UILabel(frame:  self.bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.progressView = UIView(frame: self.bounds )
        self.textLabel = UILabel(frame: self.bounds )
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addIndicatorView()
        self.addTextLabel()
    }
    
    //MARK: Public
    
    public func currentProgress() -> CGFloat {
        guard finalValue != 0 else { return 100 }
        guard currentValue != 0 else { return 0 }
        return (self.currentValue / self.finalValue) * 100
    }
    
    private func setProgressPosition() {
        let currentValue = self.currentProgress()
        
        let onePersent = self.bounds.width / 100
        let progressWidth = currentValue * onePersent
        self.progressView.frame.size.width = progressWidth
        self.layoutSubviews()
    }
    
    private func addIndicatorView() {
        let progressView = self.progressView!
        progressView.backgroundColor = self.indicatorColor
        progressView.autoresizingMask = [.flexibleBottomMargin,
                                         .flexibleWidth,
                                         .flexibleRightMargin,
                                         .flexibleTopMargin,
                                         .flexibleHeight,
                                         .flexibleBottomMargin]
        
        self.addSubview(progressView)
    }
    
    private func addTextLabel() {
        let laber = self.textLabel!
        laber.textAlignment = .center
        laber.autoresizingMask = [.flexibleBottomMargin,
                                         .flexibleWidth,
                                         .flexibleRightMargin,
                                         .flexibleTopMargin,
                                         .flexibleHeight,
                                         .flexibleBottomMargin]
        
        self.addSubview(laber)
    }
}
