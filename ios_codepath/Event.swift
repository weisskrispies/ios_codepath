//
//  Event.swift
//  ios_codepath
//
//  Created by Timothy Lee on 8/3/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

import UIKit

class Event: PFObject, PFSubclassing {
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Event"
    }
    
    @NSManaged var type : String
    @NSManaged var meetupId : String
    @NSManaged var date : NSDate
}