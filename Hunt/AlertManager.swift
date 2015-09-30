//
//  AlertManager.swift
//  Hunt
//
//  Created by smorris on 9/28/15.
//  Copyright © 2015 LateNightGames. All rights reserved.
//

import Foundation
import UIKit


func showAlert(title : String!, message : String!, viewController : UIViewController)
{
    let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
    viewController.presentViewController(alert, animated: true, completion: nil)
}

func showAlertWithError(error : NSError!, forVC : UIViewController)
{
    var errorDescription = error.localizedDescription
    
    switch error.code
    {
    case 202:
        errorDescription = "Username unavailable."
    case 101:
        errorDescription = "Incorrect username or password."
    case 200:
        errorDescription = "Please enter a username."
    case 201:
        errorDescription = "Please enter a password."
    default:
        break
    }
    
    let alert = UIAlertController(title: errorDescription, message: nil, preferredStyle: .Alert)
    let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
    alert.addAction(okAction)
    forVC.presentViewController(alert, animated: true, completion: nil)
}