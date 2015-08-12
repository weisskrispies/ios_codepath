//
//  EventCell.swift
//  ios_codepath
//
//  Created by Patrick Weiss on 8/10/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventTimeRange: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        eventDescriptionLabel.preferredMaxLayoutWidth = eventDescriptionLabel.frame.size.width
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        eventDescriptionLabel.preferredMaxLayoutWidth = eventDescriptionLabel.frame.size.width
    }

}
