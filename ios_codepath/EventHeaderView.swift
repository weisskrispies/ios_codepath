//
//  EventHeaderView.swift
//  ios_codepath
//
//  Created by Patrick Weiss on 8/9/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class EventHeaderView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventBylineLabel: UILabel!
    @IBOutlet weak var eventMonthLabel: UILabel!
    @IBOutlet weak var eventDayLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "EventHeaderView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        addSubview(contentView)
        
// Not sure how to pass the data to this Header type
//        eventTitleLabel.text = event.title
//        eventBylineLabel.text = event.byline
        
//        eventTitleLabel.preferredMaxLayoutWidth = eventTitleLabel.frame.size.width
//        eventBylineLabel.preferredMaxLayoutWidth = eventBylineLabel.frame.size.width
        
        
        // custom initialization logic

    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
