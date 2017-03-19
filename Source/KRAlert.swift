//
//  KRAlert.swift
//  KRAlert
//
//  Created by ulian_onua on 3/18/17.
//
//

import Foundation
import UIKit


class KRAlert {
    
    static var okButtonTitle = "OK"
    static var cancelButtonTitle = "Cancel"
    static var yesButtonTitle = "Yes"
    static var noButtonTitle = "No"
    static var alertErrorTitle = "ERROR"
    static var pickPhotoTitle  = "Pick Photo"
    static var pickPhotoMessage  = "Choose source"
    static var pickPhotoGalleryButtonTitle  = "From gallery"
    static var pickPhotoCameraButtonTitle  = "From camera"

    
    //MARK: Alerts

    class func alertOK(from viewController : UIViewController, title : String?, message : String?, completion:(()->Void)?) -> Void {
        alert(from: viewController, title: title, message: message, firstButtonTitle: okButtonTitle, firstButtonCompletion: completion, secondButtonTitle: nil, secondButtonCompletion: nil)
    }
    
    class func alertOKCancel(from viewController : UIViewController, title : String?, message : String?, completion:(()->Void)?) -> Void {
        alert(from: viewController, title: title, message: message, firstButtonTitle: cancelButtonTitle, firstButtonCompletion: nil, secondButtonTitle: okButtonTitle, secondButtonCompletion: completion)
    }
    
    class func alertYesNo(from viewController : UIViewController, title : String?, message : String?, yesCompletion : (()->Void)?, noCompletion:(()->Void)?) -> Void {
        alert(from: viewController, title: title, message: message, firstButtonTitle: noButtonTitle, firstButtonCompletion: noCompletion, secondButtonTitle: yesButtonTitle, secondButtonCompletion: yesCompletion)
    }
    
    
    class func alertError(from viewController : UIViewController, message : String?, completion:(()->Void)?) -> Void {
        alertOK(from: viewController, title: alertErrorTitle, message: message, completion: completion)
    }
    
    class func alert(from viewController : UIViewController, title : String?, message : String?, firstButtonTitle : String?, firstButtonCompletion: (() -> Void)?, secondButtonTitle : String?, secondButtonCompletion: (() -> Void)?) -> Void {
        var actions : [UIAlertAction] = []
        actions.append(UIAlertAction.init(title: firstButtonTitle, style: .cancel, handler: { (action) in
            if let firstButtonCompletion = firstButtonCompletion {
                firstButtonCompletion()
            }
        }))
        
        if let secondButtonTitle = secondButtonTitle {
            actions.append(UIAlertAction.init(title: secondButtonTitle, style: .default, handler: { (action) in
                if let secondButtonCompletion = secondButtonCompletion {
                    secondButtonCompletion()
                }
            }))
        }
        self.alert(from: viewController, title: title, message: message, actions: actions)
    }
    
    class func alert(from viewController : UIViewController, title : String?, message : String?, actions : [UIAlertAction]?) {
        abstractAlert(from: viewController, title: title, message: message, style: .alert, actions: actions)
    }
    
    //MARK: AlertWithTextField
    
    
    class func alertOKCancel(from viewController : UIViewController, title : String?, message : String?, textFieldPlaceholder : String?, textFieldText : String?, secureEntry : Bool, completion: @escaping (String?)->Void,  cancelCompletion: (()->Void)?) ->Void {
        
        DispatchQueue.main.async {
            let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            
            var textFieldForClosure : UITextField?
            
            alertController.addTextField(configurationHandler: { (textField) in
                textField.isSecureTextEntry = secureEntry
                textField.placeholder = textFieldPlaceholder
                textField.text = textFieldText
                textFieldForClosure = textField
            })
            
            let cancelButton = UIAlertAction.init(title: cancelButtonTitle, style: .cancel, handler: { (action) in
                if let cancelCompletion = cancelCompletion {
                    cancelCompletion()
                }
            })
            
            let okButton = UIAlertAction.init(title: okButtonTitle, style: .default, handler: { (action) in
                completion(textFieldForClosure?.text)
            })
            
            alertController.addAction(cancelButton)
            alertController.addAction(okButton)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    //MARK: Action Sheet
    
    class func actionSheetPickPhoto(from viewController : UIViewController, galleryCompletion: @escaping ()->Void, cameraCompletion: @escaping ()->Void) -> Void {
        actionSheet(from: viewController, title: pickPhotoTitle, message: pickPhotoMessage, firstButtonTitle: pickPhotoGalleryButtonTitle, firstButtonCompletion: galleryCompletion, secondButtonTitle: pickPhotoCameraButtonTitle, secondButtonCompletion: cameraCompletion)
    }
    
    class func actionSheet(from viewController : UIViewController, title : String?, message : String?, firstButtonTitle : String?, firstButtonCompletion: (() -> Void)?, secondButtonTitle : String?, secondButtonCompletion: (() -> Void)?) -> Void {
        var actions : [UIAlertAction] = []
        
        actions.append(UIAlertAction.init(title: firstButtonTitle, style: .default, handler: { (action) in
            if let firstButtonCompletion = firstButtonCompletion {
                firstButtonCompletion()
            }
        }))
        
        if let secondButtonTitle = secondButtonTitle {
            actions.append(UIAlertAction.init(title: secondButtonTitle, style: .default, handler: { (action) in
                if let secondButtonCompletion = secondButtonCompletion {
                    secondButtonCompletion()
                }
        }))
        }
        
        actions.append(UIAlertAction.init(title: cancelButtonTitle, style: .cancel, handler: nil))
        
        abstractAlert(from: viewController, title: title, message: message, style: .actionSheet, actions: actions)
        
    }
    
    class func actionSheet(from viewController : UIViewController, title: String?, message : String?, actions: [UIAlertAction]?) -> Void {
        abstractAlert(from: viewController, title: title, message: message, style: .actionSheet, actions: actions)
    }
    
    //MARK: Abstract

    class func abstractAlert(from viewController : UIViewController, title: String?, message : String?, style : UIAlertControllerStyle, actions: [UIAlertAction]?) -> Void {
        DispatchQueue.main.async {
            let alertController = self.alertController(title: title, message: message, style: style, actions: actions)
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    class func alertController(title: String?, message : String?, style : UIAlertControllerStyle, actions: [UIAlertAction]?) -> UIAlertController {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        
        // add actions to alertController
        if let actions = actions {
            for action in actions {
                alertController.addAction(action)
            }
        }
        return alertController
    }
}
