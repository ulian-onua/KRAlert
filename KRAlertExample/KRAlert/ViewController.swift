//
//  ViewController.swift
//  KRAlert
//
//  Created by ulian_onua on 3/18/17.
//
//

import UIKit

class ViewController: UIViewController, KRAlerter {

    @IBAction func alertOkTapped(_ sender: Any) {
        self.alertOK(title: "ALERT OK", message: "Everything is OK") {
            print("OK Button pressed")
        }
    }

    @IBAction func alertOkCancelTapped(_ sender: Any) {
        KRAlert.alertOKCancel(from: self, title: "ALERT OK Cancel", message: "Everything is OK") { 
            print("OK Button pressed")
        }
    }

    @IBAction func alertYesNoPressed(_ sender: Any) {
        KRAlert.alertYesNo(from: self,
                           title: "ALERT YES NO",
                           message: "Everything is ok",
                           yesCompletion: {
            print ("Yes button pressed")
        }, noCompletion: {
            print("No button pressed")
        })
    }
 
    @IBAction func alertErrorPressed(_ sender: Any) {
        KRAlert.alertError(from: self, message: "Some error happened") { 
            print("OK Pressed")
        }
    }
    
    @IBAction func customAlertWithTwoButtonsPressed(_ sender: Any) {
        KRAlert.alert(from: self, title: "Some title", message: "Some Message", firstButtonTitle: "First Button", firstButtonCompletion: { 
            print("First Button Pressed")
        }, secondButtonTitle: "Second Button") { 
            print("Second Button Pressed")
        }
    }
  
    @IBAction func alertWithTextFieldPressed(_ sender: Any) {
        alertOKCancel(title: "Alert with text field",
                      message: "Custom message",
                      textFieldPlaceholder: "Password",
                      textFieldText: nil,
                      secureEntry: true,
                      completion: { (text) in
            print("Password is \(String(describing: text))")
        }) { }
    }
  
    @IBAction func photoActionPressed(_ sender: Any) {
       actionSheetPickPhoto(galleryCompletion: {
            print("Gallery Pressed")
        }) { 
            print("Camera pressed")
        }
    }
    
    @IBAction func customActionSheet(_ sender: Any) {
        KRAlert.actionSheet(from: self,
                            title: "Some action sheet",
                            message: "Some message",
                            firstButtonTitle: "First button title",
                            firstButtonCompletion: {
            print("First button pressed")
        }, secondButtonTitle: "Second button title") { 
            print ("Second button pressed")
        }
    }
    
    @IBAction func fiveButtonsActionSheetPressed(_ sender: Any) {
        let names = ["One", "Two", "Three", "Four", "Five"]
        
        let actions: [UIAlertAction] = names.map { (name) -> UIAlertAction in
            return UIAlertAction(title: name, style: .default, handler: nil)
        }
        
        actionSheet(title: "Five buttons action",
                    message: "Here is five buttons",
                    actions: actions)
    }
    
}

