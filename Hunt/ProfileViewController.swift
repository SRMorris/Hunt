//
//  ProfileViewController.swift
//  Hunt
//
//  Created by smorris on 9/29/15.
//  Copyright © 2015 LateNightGames. All rights reserved.
//

import Parse
import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if PFUser.currentUser() == nil
        {
            performSegueWithIdentifier("ProfileToRegisterSegue", sender: self)
        }
    }

}
