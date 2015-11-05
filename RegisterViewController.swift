//
//  RegisterViewController.swift
//  Hunt
//
//  Created by smorris on 9/28/15.
//  Copyright © 2015 LateNightGames. All rights reserved.
//

import UIKit
import MapKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var userLocation: MKUserLocation!
    var myDreams : Int = 9
    let imagePicker = UIImagePickerController()
    var pickedImage : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onScreenTapped(sender: UITapGestureRecognizer)
    {
        resignFirstResponder()
    }
    
    @IBAction func registerButtonTapped(sender: UIButton)
    {
        if usernameTextField.text == "" || passwordTextField.text == ""
        {
            showAlert("Please enter a username and password", message: nil, viewController: self)
        }
        else
        {
            User.registerNewUser(usernameTextField.text, password: passwordTextField.text, email: emailTextField.text, profilePictureFile: pickedImage, gps: userLocation, completed: { (result, error) -> Void in
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
    
    
    
    //Give the option to take a new picture or pick an existing picture for the user's profile picture.
    @IBAction func onTappedPickProfilePicture(sender: UIButton)
    {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .Default)
            {
                (action) -> Void in
                if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
                {
                    self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                    self.presentViewController(self.imagePicker, animated: true, completion: nil)
                }
        }
        alert.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(
            title: "Library",
            style: .Default)
            {
                (action) -> Void in
                self.imagePicker.sourceType =  UIImagePickerControllerSourceType.PhotoLibrary
                self.presentViewController(
                    self.imagePicker,
                    animated: true,
                    completion: nil)
                
        }
        alert.addAction(libraryAction)
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .Cancel,
            handler: nil)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: {
            let selectedImaege = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImaege
            self.pickedImage = selectedImaege
        })
    }
    
}
