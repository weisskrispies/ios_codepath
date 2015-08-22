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
    @IBOutlet weak var numberAttending: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    var backgroundGray = UIColor(red: 244/255, green: 246/255, blue: 248/255, alpha: 1)
    var codepathBlue = UIColor(red: 50/255, green: 68/255, blue: 82/255, alpha: 1)
    var codepathTurquise = UIColor(red: 74/255, green: 240/255, blue: 218/255, alpha: 1)
    var codepathPeach = UIColor(red: 255/255, green: 126/255, blue: 117/255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        eventDescriptionLabel.preferredMaxLayoutWidth = eventDescriptionLabel.frame.size.width
            
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        eventDescriptionLabel.preferredMaxLayoutWidth = eventDescriptionLabel.frame.size.width
    }

}
