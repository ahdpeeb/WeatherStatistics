//
//  UIView + Extension.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 5/1/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //DESC: return snapshotView from self
    func snapshot() -> UIImageView {
        //Create the UIImage
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return UIImageView(image: image)
    }
    
    func xibContentView() -> UIView? {
        guard let contentView = loadViewFromNib() else { return nil }
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(contentView)
        
        return contentView
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        
        return view
    }
}
