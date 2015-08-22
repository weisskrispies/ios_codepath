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
    @NSManaged var dateMonth : String
    @NSManaged var dateDay : String
    @NSManaged var title : String
    @NSManaged var byline : String
    @NSManaged var content : String
    @NSManaged var numberAttending : Int
    
    var headerImage : UIImage {
        get {
            if title == "iOS for Designers" {
                return UIImage(named: "banner_ios-designers")!
            } else if title == "iOS for Engineers" {
                return UIImage(named: "banner_ios-engineers")!
            } else if title == "Android for Engineers" {
                return UIImage(named: "banner_android-engineers")!
            } else if title == "Android Debugging Workshop" {
                return UIImage(named: "banner_workshop")!
            } else {
                return UIImage(named: "banner_workshop")!
            }
            
        }
    }
}
