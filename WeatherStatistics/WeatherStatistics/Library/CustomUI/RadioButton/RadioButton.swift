//
//  RadioButton.swift
//  DigitalBank
//
//  Created by Misha Korchak on 23.05.17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

@IBDesignable
class RadioButton: UIView {

    @IBOutlet weak var radioButtonImageView: UIImageView!
    @IBOutlet weak var radioButtonTitleLabel: UILabel!
    
    @IBOutlet var view: UIView!
    
    private let radioButtonNotification = "defaultNotification"
    
    private var radioButtonInfo: [String : String] = ["key" : "", "group" : "defaultGroup"]
//    private var radioButtonOnImage = UIImage(named: ImageConstants.radioButtonOn)
//    private var radioButtonOffImage = UIImage(named: ImageConstants.radioButtonOff)
    
    @IBInspectable var isOn: Bool = false {
        didSet {
            if isOn {
//                guard let onImage = radioButtonOnImage else { return }
//                self.changeImageWithAnimation(onImage)
            } else {
//                guard let offImage = radioButtonOffImage else { return }
//                self.changeImageWithAnimation(offImage)
            }
        }
    }
    
    @IBInspectable var title: String = "Title" {
        didSet {
            self.radioButtonTitleLabel.text = title
        }
    }
    
    @IBInspectable var key: String = "" {
        didSet {
            self.radioButtonInfo.updateValue(key, forKey: "key")
        }
    }
    
    @IBInspectable var group: String! {
        didSet {
            self.radioButtonInfo.updateValue(group, forKey: "group")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = xibContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.view = xibContentView()
        self.prepareRadioButton()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func prepareRadioButton() {
        NotificationCenter.default.addObserver(self, selector: #selector(RadioButton.actOnRadioButtonNotification(_:)), name: NSNotification.Name(rawValue: radioButtonNotification), object: nil)
    }
    
    func configuration(title: String, key: String, group: String) {
        self.radioButtonInfo.updateValue(key, forKey: "key")
        self.radioButtonInfo.updateValue(group, forKey: "group")
        self.radioButtonTitleLabel.text = title
        NotificationCenter.default.removeObserver(self)
        self.prepareRadioButton()
    }
    
    private func changeImageWithAnimation(_ image: UIImage) {
        UIView.transition(with: self.radioButtonImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.radioButtonImageView.image = image
        })
    }
    
    @objc private func actOnRadioButtonNotification(_ notification: NSNotification) {
        guard let group = notification.userInfo?["group"] as? String else { return }
        guard let key = notification.userInfo?["key"] as? String else { return }
        if(self.radioButtonInfo["group"] == group) {
            if(self.radioButtonInfo["key"] == key) {
                self.isOn = true
            }
            else {
                self.isOn = false
            }
        }
    }
    
    @IBAction func radioButtonAction(_ sender: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: radioButtonNotification), object: nil, userInfo: radioButtonInfo)
    }
}
