KRAlert
===============

KRAlert is written in Swift wrapper of UIAlertController to simplify its usage in typical cases


## Installation
####CocoaPods

Just add `pod 'KRAlert'` to your Podfile and run `pod install` in Terminal from your project folder.

Write `import KRAlert` in files where you need to use KRAlert. 

Convenient usage of KRAlert is conforming to **KRAlerter protocol** which has extension with default implementation for UIViewController instances.

## How to use

### Alert Views

To present alert views perform next steps:
1) Conform to KRAlerter protocol from UIViewController which is used to present alert view
2) Call one of next convenient methods

```swift
func alertOK(title : String?, message : String?, completion:(()->Void)?) // alert with custom title, message and one button with name "OK".
func alertOKCancel(title : String?, message : String?, completion:(()->Void)?) //alert view with custom title, message and two buttons with name "OK" and "Cancel". Completion block is called if "OK" button pressed
func alertYesNo(title : String?, message : String?, yesCompletion : (()->Void)?, noCompletion:(()->Void)?) //alert view with custom title, message and two buttons with name "YES" and "NO". 
func alertError(message : String?, completion:(()->Void)?) //alert view with title "ERROR", custom message and "OK" Button
```
To present alert with one or two buttons with any title, message and buttons titles you can use next method:
```swift
func alert(title : String?, message : String?, firstButtonTitle : String?, firstButtonCompletion: (() -> Void)?, secondButtonTitle : String?, secondButtonCompletion: (() -> Void)?)
```

To present alert with as many buttons as you wish use method which takes an array of UIAlertActions instances:
```swift
func alert(title : String?, message : String?, actions : [UIAlertAction]?)
```
The example of alert with five buttons written below:
```swift
@IBAction func fiveButtonsActionSheetPressed(_ sender: Any) {
let names = ["One", "Two", "Three", "Four", "Five"]
let actions : [UIAlertAction] = names.map { (name) -> UIAlertAction in
return UIAlertAction.init(title: name, style: .default, handler: nil)
}
actionSheet(title: "Five buttons action", message: "Here is five buttons", actions: actions) // method of self
}

```
There is also the method to present alert with one UITextField instance and handle entered text:
```swift
func alertOKCancel(title : String?, message : String?, textFieldPlaceholder : String?, textFieldText : String?, secureEntry : Bool, completion: @escaping (String?)->Void,  cancelCompletion: (()->Void)?)
```
Example below can be useful for alert with textField for password from user:
```swift
@IBAction func alertWithTextFieldPressed(_ sender: Any) {
alertOKCancel(title: "Alert with text field", message: "Custom message", textFieldPlaceholder: "Password", textFieldText: nil, secureEntry: true, completion: { (text) in
print("Password is \(text)")
}) { }
}
```

### Actions sheets
Methods for presenting actions sheets are similar to methods for presenting alert views.

To present convenient method of action sheet for picking photo use next example:
```swift
@IBAction func photoActionPressed(_ sender: Any) {
actionSheetPickPhoto(galleryCompletion: {
print("Gallery Pressed")
}) { 
print("Camera pressed")
}
}
}
```
To present action sheet with one or two buttons and required button "Cancel" with any title, message and buttons titles you can use next method:
```swift
func actionSheet(title : String?, message : String?, firstButtonTitle : String?, firstButtonCompletion: (() -> Void)?, secondButtonTitle : String?, secondButtonCompletion: (() -> Void)?)
```

To present action sheet with as many buttons as you wish use method which takes an array of UIAlertActions instances:
```swift
func actionSheet(title: String?, message : String?, actions: [UIAlertAction]?)
```

## Requirements

* iOS 8.0 and above
* XCode 8+
* Example project will run only on iOS 9 and higher.

## License

KRAlert is released under the MIT license. See LICENSE for details.

## Contact

Any suggestion or question? Please create a Github issue or reach me out.

[LinkedIn](https://www.linkedin.com/in/julian-drapaylo)
