//
//  NavBar.swift
//  DigitalBank
//
//  Created by Misha Korchak on 25.05.17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import UIKit

@IBDesignable
class NavBar: UIView {

    @IBOutlet var view: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBInspectable var title: String? {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    @IBInspectable var hideFilterButton: Bool = true {
        didSet {
            if let button = filterButton {
                button.isHidden = hideFilterButton
            }
        }
    }
    
    @IBInspectable var font: UIFont?
    
    var backButtonAction: ((_ sender: UITapGestureRecognizer) -> ())?
    var filterButtonAction: ((_ sender: UIButton) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = xibContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view = xibContentView()
        filterButton.imageView?.contentMode = .scaleAspectFit
        filterButton.isHidden = hideFilterButton
        self.superview?.bringSubview(toFront: self)
    }

    @IBAction func backAction(_ sender: UITapGestureRecognizer) {
        if(backButtonAction == nil) {
//            let name = Notification.Name(Constants.NotificationIdentifier.shoudReturnToMainPage)
//            NotificationCenter.default.post(name: name, object: nil)
        }
        else {
            backButtonAction.map({ $0(sender) })
        }
    }
    
    @IBAction func filterAction(_ sender: UIButton) {
        filterButtonAction.map({ $0(sender) })
    }

}
