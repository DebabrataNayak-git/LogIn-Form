//
//  ViewController.swift
//  DevFirebaseLogInForm
//
//  Created by Debabrata Nayak on 29/01/24.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginPage: UIViewController {
    
    @IBOutlet weak var emailForLogIn: UITextField!
    @IBOutlet weak var passwordForLogIn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func logInButton(_ sender: Any) {
        guard let email = emailForLogIn.text else{return}
        guard let password = passwordForLogIn.text else{return}
        
        if email.isEmpty{
            let alert = UIAlertController(title: "Alert", 
                                          message: "please fill the email box",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "cancel", 
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else if password.isEmpty {
            let alert = UIAlertController(title: "Alert", 
                                          message: "please fill the password box",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "cancel", 
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            Auth.auth().signIn(withEmail: email, password: password){firebaseResult, error in
                if error != nil {
                    let alert = UIAlertController(title: "Alert", 
                                                  message: "Entered ID and Password is incorrect",
                                                  preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "cancel", 
                                                  style: UIAlertAction.Style.default,
                                                  handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else{
                    self.performSegue(withIdentifier: "loginSegues", sender: self)
                }
            }
        }
    }
}
