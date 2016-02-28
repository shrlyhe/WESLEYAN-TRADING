//
//  ViewController.swift
//  WesleyanTrading
//
//  Created by Shirley He on 2/27/16.
//  Copyright © 2016 Shirley He. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Dismiss keyboard tap
       let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
       view.addGestureRecognizer(tap)
        
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func logInTapped(sender: AnyObject) {
        
        let username = usernameField.text
        let password = passwordField.text
        
        
        
        
        PFUser.logInWithUsernameInBackground(username!, password: password!) {
            (user: PFUser?, error: NSError?) -> Void in
            
            if (error == nil) {
                //Successfully Logged in.
                
                print("Successfully Logged In.")
                
                let vc: AnyObject? = self.storyboard?.instantiateViewControllerWithIdentifier("postsController")
                self.presentViewController(vc as! UIViewController, animated: true, completion: nil)
                
            } else {
                //Error while logging in.
                
                var alertController = UIAlertController(title: "Error", message: "Error, Incorrect Username/Password.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }

        
  
        
    }

}
}
