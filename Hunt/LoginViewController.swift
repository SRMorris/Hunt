//
//  LoginViewController.swift
//  Hunt
//
//  Created by smorris on 9/24/15.
//  Copyright © 2015 LateNightGames. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func onLoginButtonTapped(sender: UIButton)
    {
        if usernameTextField.text == "" || passwordTextField.text == ""
        {
            showAlert("Please enter a username and password", message: nil, viewController: self)
        }
        else
        {
            User.loginUser(usernameTextField.text, password: passwordTextField.text, completed: { (result, error) -> Void in
                if error != nil
                {
                    showAlertWithError(error, forVC: self)
                }
                else
                {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            })
        }
    }
}
