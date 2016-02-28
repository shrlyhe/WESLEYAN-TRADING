//
//  RegisterViewController.swift
//  WesleyanTrading
//
//  Created by Shirley He on 2/28/16.
//  Copyright © 2016 Shirley He. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerTapped(sender: AnyObject) {
        
        var user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user.email = emailTextField.text
        
        user.signUpInBackgroundWithBlock({
            (succeeded: Bool, error: NSError?) -> Void in
            
            if error == nil {
                //There was no error.
                
                print("Successfully Signed Up User.")
                
                let vc: UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("postsController"))!
                self.presentViewController(vc, animated: true, completion: nil)
                
            } else {
                //There were one ore more errors while signing up the user.
                
                let alertController = UIAlertController(title: "Error", message: "There was one or more errors while signing up.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            
        })
        
        
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
