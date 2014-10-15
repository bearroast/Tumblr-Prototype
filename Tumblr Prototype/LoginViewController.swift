//
//  LoginViewController.swift
//  Tumblr Prototype
//
//  Created by Bjørn Eivind Rostad on 10/14/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginForm: UIView!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        //// Open the keyboard without tapping into any of the text fields
        emailField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //// Closing the modal by tapping Cancel or OK
    @IBAction func onCloseButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)

    }
}
