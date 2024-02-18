//
//  SignUpPage.swift
//  DevFirebaseLogInForm
//
//  Created by Debabrata Nayak on 29/01/24.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpPage: UIViewController {
    
    @IBOutlet weak var emailForSignUp: UITextField!
    @IBOutlet weak var passwordForSignUp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        guard let email = emailForSignUp.text else{return}
        guard let password = passwordForSignUp.text else{return}
        
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
            
            Auth.auth().createUser(withEmail: email, password: password){firebaseResult, error in
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
                    self.performSegue(withIdentifier: "signUpSegues", sender: self)
                }
            }
        }
        
    }
}
