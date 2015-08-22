//
//  FeedViewController.swift
//  CodePathApp
//
//  Created by Dairien Boyd on 8/3/15.
//  Copyright (c) 2015 Dairien Boyd. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var topbarView: UIView!
    
    var selectedEventImageView: UIImageView!
    
    var expandTransition: ExpandTransition!
    var isPresenting: Bool = true
    
    var backgroundGray = UIColor(red: 244/255, green: 246/255, blue: 248/255, alpha: 1)
    var codepathBlue = UIColor(red: 50/255, green: 68/255, blue: 82/255, alpha: 1)
    
    // Arrays hold dummy content for feed
    var banners: [String!] = [
        "banner_android-engineers",
        "banner_ios-designers",
        "banner_ios-engineers",
        "banner_workshop"]
    var titles: [String!] = [
        "Android for Engineers",
        "iOS for Designers",
        "iOS for Engineers",
        "Android Debugging Workshop"]
    var descriptions: [String!] = [
        "Use your existing skills to master Java",
        "Learn swift basics to prototypes in code",
        "Use your existing skills to master Swift",
        "Debugging concepts, approaches, and tools"]
    var dateMonth: [String!] = [
        "July",
        "Sept",
        "Sept",
        "Sept"]
    var dateDay: [String!] = [
        "02",
        "14",
        "14",
        "14"]
    
    
    var feedItems : [Feed]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // manually sets up data elements to have values (DELETE THIS when Parse is connected)
        var event1 = Event()
        event1.title = titles[0]
        event1.byline = descriptions[0]
        event1.content = "This bootcamp empowers designers to modify the view and animation related code for iOS Swift prototypes as well as production apps. There is a focus on views, navigation, transitions, and animations. It omits advanced topics, such as networking, threading, models, and device frameworks for accessing the camera and location."
        event1.dateMonth = dateMonth[0]
        event1.dateDay = dateDay[0]

        var feedItem1 = Feed()
        feedItem1.event = event1
        
        var event2 = Event()
        event2.title = titles[1]
        event2.byline = descriptions[1]
        event2.content = "This placeholder text empowers designers to modify the view and animation related code for iOS Swift prototypes as well as production apps. There is a focus on views, navigation, transitions, and animations. It omits advanced topics, such as networking, threading, models, and device frameworks for accessing the camera and location."
        event1.dateMonth = dateMonth[1]
        event1.dateDay = dateDay[1]
        
        var feedItem2 = Feed()
        feedItem2.event = event2
        
        var event3 = Event()
        event3.title = titles[2]
        event3.byline = descriptions[2]
        event3.content = "This placeholder text empowers designers to modify the view and animation related code for iOS Swift prototypes as well as production apps. There is a focus on views, navigation, transitions, and animations. It omits advanced topics, such as networking, threading, models, and device frameworks for accessing the camera and location."
        event1.dateMonth = dateMonth[2]
        event1.dateDay = dateDay[2]
        
        var feedItem3 = Feed()
        feedItem3.event = event3
        
        var event4 = Event()
        event4.title = titles[3]
        event4.byline = descriptions[3]
        event4.content = "This placeholder text empowers designers to modify the view and animation related code for iOS Swift prototypes as well as production apps. There is a focus on views, navigation, transitions, and animations. It omits advanced topics, such as networking, threading, models, and device frameworks for accessing the camera and location."
        event1.dateMonth = dateMonth[3]
        event1.dateDay = dateDay[3]
        
        var feedItem4 = Feed()
        feedItem4.event = event4
        
        feedItems.append(feedItem1)
        feedItems.append(feedItem2)
        feedItems.append(feedItem3)
        feedItems.append(feedItem4)
        
        
        topbarView.backgroundColor = codepathBlue
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.rowHeight = UITableViewAutomaticDimension
        feedTableView.backgroundColor = backgroundGray
        feedTableView.estimatedRowHeight = 200
        feedTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        // offset for top bar
        feedTableView.contentInset.top = 75
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("FeedCell") as! FeedCell
        
        // Set feed cells based on arrays above
        cell.feedImageView.image = UIImage(named: banners[indexPath.row])
        cell.feedTitleLabel.text = titles[indexPath.row]
        cell.feedDescriptionLabel.text = descriptions[indexPath.row]
        cell.dateMonth.text = dateMonth[indexPath.row]
        cell.dateDay.text = dateDay[indexPath.row]
        println(cell.frame.size)
        //cell.contentView.frame = cell.bounds
        //cell.contentView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        
        
        return cell
        
    }



    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        var feedItem = feedItems[indexPath.row]
        
        if feedItem.event != nil {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.performSegueWithIdentifier("eventSegue", sender: feedItem.event)
            })
            
        } else if feedItem.cohort != nil {
            
            performSegueWithIdentifier("courseSegue", sender: feedItem.event)
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var fromViewController = segue.sourceViewController as! UIViewController
        var toViewController = segue.sourceViewController as! UIViewController
        var identifier = segue.identifier
        

        
        if sender is Event {
                        
            var event = sender as! Event
            var eventViewController = segue.destinationViewController as! EventViewController
            var identifier = segue.identifier
            
            eventViewController.event = event

// trying to figure out how to access the background image in the cell and assign it to selectedEventImageView so it can be passed
//            selectedEventImageView = event.feedImageView.image
            
            println("we got this image \(selectedEventImageView)")
            
            expandTransition = ExpandTransition()
            eventViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            eventViewController.transitioningDelegate = expandTransition
        }
        
    }
}

