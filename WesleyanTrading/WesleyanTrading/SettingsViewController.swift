//
//  SettingsViewController.swift
//  WesleyanTrading
//
//  Created by Shirley He on 2/28/16.
//  Copyright © 2016 Shirley He. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logoutTapped(sender: AnyObject) {
        PFUser.logOut()
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("loginVC")
        self.presentViewController(vc!, animated: true, completion: nil)
        
        
        
        
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
