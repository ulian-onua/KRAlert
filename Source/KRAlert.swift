//
//  KRAlert.swift
//  Created by Julian Drapaylo.
//  Copyright © 2019 Julian Drapaylo. All rights reserved.
//

import UIKit

public class KRAlert {
    
    // MARK: - Variables
    
    public static var okButtonTitle = "OK"
    public static var cancelButtonTitle = "Cancel"
    public static var yesButtonTitle = "Yes"
    public static var noButtonTitle = "No"
    public static var alertErrorTitle = "ERROR"
    public static var pickPhotoTitle  = "Pick Photo"
    public static var pickPhotoMessage  = "Choose source"
    public static var pickPhotoGalleryButtonTitle  = "From gallery"
    public static var pickPhotoCameraButtonTitle  = "From camera"

    // MARK: - Alerts

    open class func alertOK(from viewController: UIViewController,
                            title: String?,
                            message: String?,
                            completion: (() -> Void)?) {
        
        alert(from: viewController,
              title: title,
              message: message,
              firstButtonTitle: okButtonTitle,
              firstButtonCompletion: completion,
              secondButtonTitle: nil,
              secondButtonCompletion: nil)
        
    }
    
    open class func alertOKCancel(from viewController: UIViewController,
                                  title: String?,
                                  message: String?,
                                  completion: (() -> Void)?) {
        
        alert(from: viewController,
              title: title,
              message: message,
              firstButtonTitle: cancelButtonTitle,
              firstButtonCompletion: nil,
              secondButtonTitle: okButtonTitle,
              secondButtonCompletion: completion)
        
    }
    
    open class func alertYesNo(from viewController: UIViewController,
                               title: String?,
                               message: String?,
                               yesCompletion: (() -> Void)?,
                               noCompletion: (() -> Void)?) {
        
        alert(from: viewController,
              title: title,
              message: message,
              firstButtonTitle: noButtonTitle,
              firstButtonCompletion: noCompletion,
              secondButtonTitle: yesButtonTitle,
              secondButtonCompletion: yesCompletion)
        
    }
    
    open class func alertError(from viewController: UIViewController,
                               message: String?,
                               completion:(() -> Void)?) {
        
        alertOK(from: viewController,
                title: alertErrorTitle,
                message: message,
                completion: completion)
        
    }
    
    open class func alert(from viewController: UIViewController,
                          title: String?,
                          message: String?,
                          firstButtonTitle: String?,
                          firstButtonCompletion: (() -> Void)?,
                          secondButtonTitle: String?,
                          secondButtonCompletion: (() -> Void)?){
        
        var actions: [UIAlertAction] = []
        
        actions.append(UIAlertAction(title: firstButtonTitle,
                                     style: .cancel,
                                     handler: { (action) in
            if let firstButtonCompletion = firstButtonCompletion {
                firstButtonCompletion()
            }
        }))
        
        if let secondButtonTitle = secondButtonTitle {
            actions.append(UIAlertAction(title: secondButtonTitle,
                                         style: .default,
                                         handler: { (action) in
                if let secondButtonCompletion = secondButtonCompletion {
                    secondButtonCompletion()
                }
            }))
        }
        alert(from: viewController, title: title, message: message, actions: actions)
    }
    
    open class func alert(from viewController: UIViewController,
                          title: String?,
                          message: String?,
                          actions: [UIAlertAction]?) {
        abstractAlert(from: viewController,
                      title: title,
                      message: message,
                      style: .alert,
                      actions: actions)
    }
    
    // MARK: - Alert with UITextField
    
    open class func alertOKCancel(from viewController: UIViewController,
                                    title: String?,
                                    message: String?,
                                    textFieldPlaceholder: String?,
                                    textFieldText: String?,
                                    secureEntry: Bool,
                                    completion: @escaping (String?) -> Void,
                                    cancelCompletion: (() -> Void)?) {
        
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
            
            var textFieldForClosure: UITextField?
            
            alertController.addTextField(configurationHandler: { (textField) in
                textField.isSecureTextEntry = secureEntry
                textField.placeholder = textFieldPlaceholder
                textField.text = textFieldText
                textFieldForClosure = textField
            })
            
            let cancelButton = UIAlertAction(title: cancelButtonTitle,
                                             style: .cancel,
                                             handler: { (action) in
                if let cancelCompletion = cancelCompletion {
                    cancelCompletion()
                }
            })
            
            let okButton = UIAlertAction(title: okButtonTitle,
                                         style: .default,
                                         handler: { (action) in
                completion(textFieldForClosure?.text)
            })
            
            alertController.addAction(cancelButton)
            alertController.addAction(okButton)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Action Sheet
    
    open class func actionSheetPickPhoto(from viewController: UIViewController,
                                           galleryCompletion: @escaping () -> Void,
                                           cameraCompletion: @escaping () -> Void) {
        actionSheet(from: viewController,
                    title: pickPhotoTitle,
                    message: pickPhotoMessage,
                    firstButtonTitle: pickPhotoGalleryButtonTitle,
                    firstButtonCompletion: galleryCompletion,
                    secondButtonTitle: pickPhotoCameraButtonTitle,
                    secondButtonCompletion: cameraCompletion)
        
    }
    
    open class func actionSheet(from viewController: UIViewController,
                                  title: String?,
                                  message: String?,
                                  firstButtonTitle: String?,
                                  firstButtonCompletion: (() -> Void)?,
                                  secondButtonTitle: String?,
                                  secondButtonCompletion: (() -> Void)?) {
        
        var actions: [UIAlertAction] = []
        
        actions.append(UIAlertAction(title: firstButtonTitle,
                                     style: .default,
                                     handler: { (action) in
            if let firstButtonCompletion = firstButtonCompletion {
                firstButtonCompletion()
            }
        }))
        
        if let secondButtonTitle = secondButtonTitle {
            actions.append(UIAlertAction(title: secondButtonTitle,
                                         style: .default,
                                         handler: { (action) in
                if let secondButtonCompletion = secondButtonCompletion {
                    secondButtonCompletion()
                }
        }))
        }
        
        actions.append(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil))
        
        abstractAlert(from: viewController,
                      title: title,
                      message: message,
                      style: .actionSheet,
                      actions: actions)
        
    }
    
    open class func actionSheet(from viewController: UIViewController,
                                title: String?,
                                message: String?,
                                actions: [UIAlertAction]?) {
        
        abstractAlert(from: viewController,
                      title: title,
                      message: message,
                      style: .actionSheet,
                      actions: actions)
        
    }
    
    // MARK: - Abstract

    public class func abstractAlert(from viewController: UIViewController,
                                    title: String?,
                                    message: String?,
                                    style: UIAlertController.Style,
                                    actions: [UIAlertAction]?) {
        DispatchQueue.main.async {
            let alertController = self.alertController(title: title,
                                                       message: message,
                                                       style: style,
                                                       actions: actions)
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    public class func alertController(title: String?,
                                      message: String?,
                                      style: UIAlertController.Style,
                                      actions: [UIAlertAction]?) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: style)
        
        if let actions = actions {
            for action in actions {
                alertController.addAction(action)
            }
        }
        return alertController
    }
}

