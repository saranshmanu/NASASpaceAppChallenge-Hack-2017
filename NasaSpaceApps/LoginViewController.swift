//
//  LoginViewController.swift
//  NasaSpaceApps
//
//  Created by Saransh Mittal on 18/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var signupAction: UIButton!
    @IBOutlet weak var loginAction: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // for hitting return
        usernameField.delegate = self
        passwordField.delegate = self
        
        loginAction.layer.cornerRadius = loginButton.frame.height/2
        signupButton.layer.cornerRadius = signupButton.frame.height/2
        usernameField.layer.cornerRadius = usernameField.frame.height/2
        passwordField.layer.cornerRadius = passwordField.frame.height/2
        // to change the color of the placeholder
        usernameField.attributedPlaceholder = NSAttributedString(string: usernameField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        passwordField.attributedPlaceholder = NSAttributedString(string: passwordField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
//        usernameField.layer.borderWidth = 1.2
//        usernameField.layer.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
//        passwordField.layer.borderWidth = 1.2
//        passwordField.layer.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
//        usernameField.backgroundColor = UIColor.init(red: 19, green: 32, blue: 53, alpha: 1.0)
//        passwordField.backgroundColor = UIColor.init(red: 19, green: 32, blue: 53, alpha: 1.0)
//        usernameField.textColor = UIColor.white
//        passwordField.textColor = UIColor.white
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard)))
    }
    
    var keyboard_flag = 0
    
    func keyboardWillHide(_ notification: Notification) {
        print("HIDE")
        if keyboard_flag == 0 {
            return
        }
        keyboard_flag = 0
        let userInfo: NSDictionary = (notification as NSNotification).userInfo! as NSDictionary
        let keyboardFrame: NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardHeight = keyboardFrame.cgRectValue.height
        let duration = userInfo.object(forKey: UIKeyboardAnimationDurationUserInfoKey) as! TimeInterval
        bottomConstraint.constant -= (keyboardHeight-100)
        topConstraint.constant += (40)
        UIView.animate(withDuration: 0.5, animations: {void in
            
            self.view.layoutIfNeeded()
            
        })
    }
    
    func keyboardWillShow(_ notification: Notification) {
        print("SHow")
        if keyboard_flag != 0 {
            return
        }
        keyboard_flag = 1
        let userInfo: NSDictionary = (notification as NSNotification).userInfo! as NSDictionary
        let keyboardFrame: NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardHeight = keyboardFrame.cgRectValue.height
        let duration = userInfo.object(forKey: UIKeyboardAnimationDurationUserInfoKey) as! TimeInterval
        self.bottomConstraint.constant += (keyboardHeight-100)
        topConstraint.constant -= (40)
        UIView.animate(withDuration: 0.5, animations: {void in
            self.view.layoutIfNeeded()
        })
    }
    
    // for tapping
    func dismissKeyboard() {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    // for hitting return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
