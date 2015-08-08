//
//  FeedCell.swift
//  CodePathApp
//
//  Created by Dairien Boyd on 8/3/15.
//  Copyright (c) 2015 Dairien Boyd. All rights reserved.
//

import UIKit

class FeedCell : UITableViewCell {
    
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
