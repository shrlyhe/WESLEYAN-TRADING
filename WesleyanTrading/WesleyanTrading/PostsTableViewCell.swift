//
//  PostsTableViewCell.swift
//  WesleyanTrading
//
//  Created by Shirley He on 2/27/16.
//  Copyright © 2016 Shirley He. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts

class PostsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var postsImageView: PFImageView!
    @IBOutlet weak var postsCaption: UILabel!
    @IBOutlet weak var addedBy: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
