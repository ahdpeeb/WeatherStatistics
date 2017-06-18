//
//  UIViewController + Allert.swift
//  DigitalBank
//
//  Created by Nikola Andriiev on 5/22/17.
//  Copyright © 2017 iosDeveloper. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentErrorController(title: String?, message: String?) {
        let controller = UIAlertController.presentSimpleError(title: title, message: message)
        self.present(controller, animated: true)
    }
    
    typealias RepeatAction = (_ sender: UIAlertAction) -> ()
    func presentRepeatErrorController(title: String = "Ошибка", error: Error, titleForAction: String = "Повторить", action: @escaping RepeatAction) {
        let message = ""
//        if let RXError = error as? BaseViewModel.RxRequstError {
//            message = RXError.debugDescription
//        } else {
//            message = error.localizedDescription
//        }
        
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: titleForAction, style: .default) { (sender) in
            action(sender)
        }
        
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
}
