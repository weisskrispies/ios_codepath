//
//  LoginViewController.swift
//  ios_codepath
//
//  Created by Patrick Weiss on 7/31/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var githubLabel: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var topMargin: NSLayoutConstraint!
    var topMarginOriginalLocation: CGFloat!
    
    @IBOutlet weak var passwordFieldUpperMargin: NSLayoutConstraint!
    var passwordOriginalUpperMargin: CGFloat!
    var passwordShownUpperMargin: CGFloat = 10
    
    @IBOutlet weak var skipButtonBottomMargin: NSLayoutConstraint!
    var skipButtonOriginalMargin: CGFloat!
    var skipButtonUpMargin: CGFloat!
    
    @IBOutlet weak var userNameLabelTopMargin: NSLayoutConstraint!
    var userNameLabelOriginalMargin: CGFloat!
    
    @IBOutlet weak var passwordLabelTopMargin: NSLayoutConstraint!
    var passwordLabelOriginalMargin: CGFloat!
    
    @IBOutlet weak var nextButtonRightMargin: NSLayoutConstraint!
    
    var githubLabelOriginalPosition: CGFloat!
    
    var userNameTextFieldOriginalPosition: CGFloat!
    var userNameLabelOrignalPosition: CGFloat!
    
    var passwordFieldOriginalPosition: CGFloat!
    var passwordLabelOriginalPosition: CGFloat!
    
    var nextButtonOriginalPosition: CGFloat!
    var nextButtonOffset: CGFloat = 236
    
    var visibleHeight: CGFloat!
    var visibleHeightCenter: CGFloat!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topMarginOriginalLocation = topMargin.constant
        passwordOriginalUpperMargin = passwordFieldUpperMargin.constant
        skipButtonOriginalMargin = skipButtonBottomMargin.constant
        userNameLabelOriginalMargin = userNameLabelTopMargin.constant
        passwordLabelOriginalMargin = passwordLabelTopMargin.constant
        
        
        // sets the cursor color to turqoise
        userNameTextField.tintColor = UIColor(red: 74/255, green: 240/255, blue: 218/255, alpha: 1.0)
        passwordTextField.tintColor = UIColor(red: 74/255, green: 240/255, blue: 218/255, alpha: 1.0)
        
        
        // hide password field until user taps into user name field
        passwordTextField.alpha = 0
        passwordLabel.alpha = 0
        nextButton.alpha = 0
        
        
        // sets text inset for each text box
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, self.userNameTextField.frame.height))
        userNameTextField.leftView = paddingView
        userNameTextField.leftViewMode = UITextFieldViewMode.Always
        
        let passwordPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.passwordTextField.frame.height))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = UITextFieldViewMode.Always
        
        // calls the method to identify keyboard height
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
//            userNameLabel.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
//        setAnchorPoint(CGPoint(x: 0, y: 0.5), forView: userNameLabel)
        
        println("user name anchor point \(userNameLabel.layer.anchorPoint)")
        
        nextButtonHidden()
        
    }
    
    func animateFieldsUp() {
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.topMargin.constant = self.visibleHeightCenter - 100
            self.view.layoutIfNeeded()
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func animateFieldsDown() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.topMargin.constant = self.topMarginOriginalLocation
            self.view.layoutIfNeeded()
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func showPasswordField() {
        UIView.animateWithDuration(0.3, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.passwordTextField.alpha = 1
            self.passwordLabel.alpha = 1
            self.passwordFieldUpperMargin.constant = self.passwordShownUpperMargin
            self.view.layoutIfNeeded()
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func hidePasswordField() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.passwordTextField.alpha = 0
            self.passwordLabel.alpha = 0
            self.passwordFieldUpperMargin.constant = self.passwordOriginalUpperMargin
            self.view.layoutIfNeeded()
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func skipButtonUp() {
        UIView.animateWithDuration(0.3, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.skipButtonBottomMargin.constant = self.skipButtonUpMargin
            self.view.layoutIfNeeded()
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func skipButtonDown() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.skipButtonBottomMargin.constant = self.skipButtonOriginalMargin
            self.view.layoutIfNeeded()
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func userNameLabelUp() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.userNameLabelTopMargin.constant = 6
            self.userNameLabel.transform = CGAffineTransformMakeScale(CGFloat(0.8), CGFloat(0.8))
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func userNameLabelDown() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.userNameLabelTopMargin.constant = self.userNameLabelOriginalMargin
            self.userNameLabel.transform = CGAffineTransformMakeScale(CGFloat(1.0), CGFloat(1.0))
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func passwordLabelUp() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.passwordLabelTopMargin.constant = 5
            self.passwordLabel.transform = CGAffineTransformMakeScale(CGFloat(0.8), CGFloat(0.8))
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func passwordLabelDown() {
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.passwordLabelTopMargin.constant = self.passwordLabelOriginalMargin
            self.passwordLabel.transform = CGAffineTransformMakeScale(CGFloat(1.0), CGFloat(1.0))
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func nextButtonShown() {
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.nextButtonRightMargin.constant = 0
            self.nextButton.alpha = 1
            self.view.layoutIfNeeded()
            
            }) { (finished:Bool) -> Void in
        }
    }
    
    func nextButtonHidden() {

        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.nextButtonRightMargin.constant = -self.nextButton.frame.width
            self.nextButton.alpha = 0
            self.view.layoutIfNeeded()
            
            }) { (finished:Bool) -> Void in
        }
    }

    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        self.visibleHeight = view.frame.size.height - kbSize.height
        self.visibleHeightCenter = visibleHeight / 2
        self.skipButtonUpMargin = kbSize.height + 16
        
        println("keyboard height = \(kbSize.height)")
        println("screen height = \(view.frame.size.height)")
        println("visible height = \(visibleHeight)")
        println("visible center = \(visibleHeightCenter)")
        println("skip button up margin = \(skipButtonUpMargin)")
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        animateFieldsUp()
        showPasswordField()
        skipButtonUp()
        userNameLabelUp()
        
    }
    
    // helper for common swift file
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = CGPointApplyAffineTransform(newPoint, view.transform)
        oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform)
        
        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }
    
    @IBAction func onTapToDismiss(sender: AnyObject) {
        view.endEditing(true)
        
        skipButtonDown()
        animateFieldsDown()
        
        if userNameTextField.text.isEmpty && passwordTextField.text.isEmpty {
            
                self.hidePasswordField()
                self.userNameLabelDown()
                self.passwordLabelDown()

        }
        else if userNameTextField.text.isEmpty {
            
                self.userNameLabelDown()

        } else if passwordTextField.text.isEmpty {
            
            self.passwordLabelDown()
        }
        
    }
    
    @IBAction func onUserNameTapToEdit(sender: AnyObject) {

        if passwordTextField.text.isEmpty && userNameTextField.text.isEmpty {
            
            self.userNameLabelUp()
            self.passwordLabelDown()
            
        } else {
            
            self.userNameLabelUp()
        }
    
    }
    
    @IBAction func onPasswordTapToEdit(sender: AnyObject) {
        
        if passwordTextField.text.isEmpty && userNameTextField.text.isEmpty {
            
            self.userNameLabelDown()
            self.passwordLabelUp()
            
        } else {
            self.passwordLabelUp()
        }
        
    }
    
    
    @IBAction func onPasswordEntered(sender: AnyObject) {
        
        if userNameTextField.text.isEmpty || passwordTextField.text.isEmpty {

            nextButtonHidden()
            
        } else {
            
            nextButtonShown()
        }
    }
    


    //
    //    @IBAction func didTapLogin(sender: AnyObject) {
    //
    //        var alert = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)
    //
    //        view.endEditing(true)
    //
    //        if userNameTextField.text.isEmpty || passwordTextField.text.isEmpty {
    //            var alertView = UIAlertView(title: "Oops!", message: "Dude, enter some more deets", delegate: nil, cancelButtonTitle: "Got it")
    //            alertView.show()
    //        } else {
    //            alert.show()
    //            delay(2, { () -> () in
    //                alert.dismissWithClickedButtonIndex(0, animated: true)
    //                if self.emailField.text == "patrick@bluemangroup.com" && self.passwordField.text == "drumbeat" {
    //
    //                    self.performSegueWithIdentifier("signInSegue", sender: nil)
    //
    //                } else {
    //                    var alertView = UIAlertView(title: "Oops!", message: "Incorrect name or pasword", delegate: nil, cancelButtonTitle: "Got it")
    //                    alertView.show()
    //                }
    //            })
    //        }
    //
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
  
    
    
}

