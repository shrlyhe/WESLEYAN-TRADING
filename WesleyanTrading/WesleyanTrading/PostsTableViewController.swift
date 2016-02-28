//
//  PostsTableViewController.swift
//  WesleyanTrading
//
//  Created by Shirley He on 2/27/16.
//  Copyright © 2016 Shirley He. All rights reserved.
//

//images[0] = first post's image
//imageCaptions[0] = first post's caption
//iamgeDates[0] = first post's date
//imageUsers[0] = first post's addedBy

import UIKit
import Parse
import ParseUI
import Bolts

class PostsTableViewController: UITableViewController {

    var images = [PFFile]()
    var imageCaptions = [String]()
    var imageDates = [String]()
    var imageUsers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //refresh data - pull down
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("refreshPulled"), forControlEvents: UIControlEvents.ValueChanged)
        
        

        loadData()
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func refreshPulled() {
        
        loadData()
        self.tableView.reloadData()
        
        refreshControl?.endRefreshing()
        
    }
    
    func loadData() {
        
        var query = PFQuery(className: "Posts")
        query.orderByDescending("createdAt")
   
        
    
 
        query.findObjectsInBackgroundWithBlock {
            (posts:[PFObject]?, error: NSError?) -> Void in
           // (posts: [AnyObject]?, error: NSError?)  -> Void in
            
            if (error == nil) {
                //No error
                
               // if let posts = posts as! [PFObject] {
                    for post in posts! {
                        
                        self.images.append(post["Image"] as! PFFile)
                        self.imageCaptions.append(post["Caption"] as! String)
                        self.imageDates.append(post["date"] as! String)
                        self.imageUsers.append(post["addedBy"] as! String)
                        
                   // }
                    
                    self.tableView.reloadData()
                    
                }
                
            } else {
                //Error
            }
            
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostsTableViewCell

        // Configure the cell...
        
        var imageToLoad = self.images[indexPath.row] as PFFile
        var imageCaption = self.imageCaptions[indexPath.row] as String
        var imageDate = self.imageDates[indexPath.row] as String
        var imageUser = self.imageUsers[indexPath.row] as String
        
        var imageData = try! imageToLoad.getData()
        var finalizedImage = UIImage(data: imageData)
        
        cell.postsImageView.image = finalizedImage
        cell.postsCaption.text = imageCaption
        cell.addedBy.text = imageUser
        cell.dateLabel.text = imageDate
        
        return cell

        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
