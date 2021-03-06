//
//  KRAlerter.swift
//  Created by Julian Drapaylo.
//  Copyright © 2019 Julian Drapaylo. All rights reserved.
//

import UIKit

public protocol KRAlerter {
    func alertOK(title: String?, message: String?, completion: (() -> Void)?)
    
    func alertOKCancel(title: String?, message: String?, completion: (() -> Void)?)
    
    func alertYesNo(title: String?,
                    message: String?,
                    yesCompletion: (() -> Void)?,
                    noCompletion: (() -> Void)?)
    
    func alertError(message: String?, completion: (() -> Void)?)
    
    func alert(title: String?,
               message: String?,
               firstButtonTitle: String?,
               firstButtonCompletion: (() -> Void)?,
               secondButtonTitle: String?,
               secondButtonCompletion: (() -> Void)?)
    
    func alert(title: String?, message: String?, actions: [UIAlertAction]?)
    
    func alertOKCancel(title: String?,
                       message: String?,
                       textFieldPlaceholder: String?,
                       textFieldText: String?,
                       secureEntry: Bool,
                       completion: @escaping (String?) -> Void,
                       cancelCompletion: (() -> Void)?)
    
    func actionSheetPickPhoto(galleryCompletion: @escaping () -> Void,
                              cameraCompletion: @escaping () -> Void)
    
    func actionSheet(title: String?,
                     message: String?,
                     firstButtonTitle: String?,
                     firstButtonCompletion: (() -> Void)?,
                     secondButtonTitle: String?,
                     secondButtonCompletion: (() -> Void)?)
    
    func actionSheet(title: String?, message: String?, actions: [UIAlertAction]?)
    
}

public extension KRAlerter where Self:UIViewController {
    // MARK: - Alerts
    
    func alertOK(title: String?, message: String?, completion: (() -> Void)?) {
        KRAlert.alertOK(from: self, title: title, message: message, completion: completion)
    }
    
    func alertOKCancel(title: String?, message: String?, completion: (() -> Void)?) {
        KRAlert.alertOKCancel(from: self, title: title, message: message, completion: completion)
    }
    
    func alertYesNo(title: String?,
                    message: String?,
                    yesCompletion: (() -> Void)?,
                    noCompletion:(() -> Void)?) {
        
        KRAlert.alertYesNo(from: self,
                           title: title,
                           message: message,
                           yesCompletion: yesCompletion,
                           noCompletion: noCompletion)
        
    }
    
    func alertError(message: String?, completion: (() -> Void)?) {
        KRAlert.alertError(from: self, message: message, completion: completion)
    }
    
    func alert(title: String?,
               message: String?,
               firstButtonTitle: String?,
               firstButtonCompletion: (() -> Void)?,
               secondButtonTitle: String?,
               secondButtonCompletion: (() -> Void)?) {
        
        KRAlert.alert(from: self,
                      title: title,
                      message: message,
                      firstButtonTitle: firstButtonTitle,
                      firstButtonCompletion: firstButtonCompletion,
                      secondButtonTitle: secondButtonTitle,
                      secondButtonCompletion: secondButtonCompletion)
        
    }
    
    func alert(title: String?, message: String?, actions: [UIAlertAction]?) {
        KRAlert.alert(from: self, title: title, message: message, actions: actions)
    }
    
    func alertOKCancel(title: String?,
                       message: String?,
                       textFieldPlaceholder: String?,
                       textFieldText: String?,
                       secureEntry: Bool,
                       completion: @escaping (String?) -> Void,
                       cancelCompletion: (() -> Void)?) {
        
        KRAlert.alertOKCancel(from: self,
                              title: title,
                              message: message,
                              textFieldPlaceholder: textFieldPlaceholder,
                              textFieldText: textFieldText,
                              secureEntry: secureEntry,
                              completion: completion,
                              cancelCompletion: cancelCompletion)
        
    }
    
    // MARK: - Action Sheets
    
    func actionSheetPickPhoto(galleryCompletion: @escaping () -> Void,
                              cameraCompletion: @escaping () -> Void) {
        
        KRAlert.actionSheetPickPhoto(from: self,
                                     galleryCompletion: galleryCompletion,
                                     cameraCompletion: cameraCompletion)
        
    }
    
    func actionSheet(title: String?,
                     message: String?,
                     firstButtonTitle: String?,
                     firstButtonCompletion: (() -> Void)?,
                     secondButtonTitle: String?,
                     secondButtonCompletion: (() -> Void)?) {
        
        KRAlert.actionSheet(from: self,
                            title: title,
                            message: message,
                            firstButtonTitle: firstButtonTitle,
                            firstButtonCompletion: firstButtonCompletion,
                            secondButtonTitle: secondButtonTitle,
                            secondButtonCompletion: secondButtonCompletion)
        
    }
    
    func actionSheet(title: String?, message: String?, actions: [UIAlertAction]?) {
        KRAlert.actionSheet(from: self, title: title, message: message, actions: actions)
    }
}

