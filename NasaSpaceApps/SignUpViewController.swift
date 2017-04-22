//
//  SignUpViewController.swift
//  NasaSpaceApps
//
//  Created by Saransh Mittal on 20/04/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var OrganisationTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var SubmitButton: UIButton!
    
    @IBAction func signUpAction(_ sender: Any) {
        if EmailTextField.text != "" && PasswordTextField.text != "" {
            Alamofire.request("https://nasaspaceapps.herokuapp.com/auth/save", method: .post, parameters: ["email" : EmailTextField.text!,"password": PasswordTextField.text!,"name": NameTextField.text!,"college": OrganisationTextField.text!,"skill": NameTextField.text!]).responseJSON(completionHandler: {response in
                print(response)
                
                if((response.result.value) != nil) {
                    let swiftyJsonVar = JSON(response.result.value!)
                    print(swiftyJsonVar)
                    if swiftyJsonVar["code"]=="0"
                    {
                        //Print into the console if successfully logged in
                        print("You have successfully signed up")
                        //alert for user to know that he has successfully signed up
                        let alertController = UIAlertController(title: "Success", message: "You have successfully sign up. Wait for us to respond.", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                        //Go to the HomeViewController if the login is sucessful
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginPageViewController")
                        self.present(vc!, animated: true, completion: nil)
                    }
                    else
                    {
                        print("Sign Up not successful as the user has already signed up or credentials are invalid")
                        let alertController = UIAlertController(title: "Incorrect credentials", message: "Incorrect email or password, Please Try again!", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
                
            })
        }
        else{
            let alertController = UIAlertController(title: "Error", message: "Please enter the details carefully", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard)))
        OrganisationTextField.attributedPlaceholder = NSAttributedString(string: OrganisationTextField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        OrganisationTextField.layer.cornerRadius = OrganisationTextField.frame.height/2
        PasswordTextField.attributedPlaceholder = NSAttributedString(string: PasswordTextField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        PasswordTextField.layer.cornerRadius = PasswordTextField.frame.height/2
        EmailTextField.attributedPlaceholder = NSAttributedString(string: EmailTextField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        EmailTextField.layer.cornerRadius = EmailTextField.frame.height/2
        NameTextField.attributedPlaceholder = NSAttributedString(string: NameTextField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        NameTextField.layer.cornerRadius = NameTextField.frame.height/2
        SubmitButton.layer.cornerRadius = SubmitButton.frame.height/2
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // for tapping
    func dismissKeyboard() {
        OrganisationTextField.resignFirstResponder()
        EmailTextField.resignFirstResponder()
        NameTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }
    // for hitting return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        OrganisationTextField.resignFirstResponder()
        EmailTextField.resignFirstResponder()
        NameTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
        return true
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
