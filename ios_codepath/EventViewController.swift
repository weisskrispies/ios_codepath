//
//  EventViewController.swift
//  ios_codepath
//
//  Created by Patrick Weiss on 8/9/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var eventHeaderView: EventHeaderView!

    var event: Event!
    
    var backgroundImage: UIImage!
    
    var backgroundGray = UIColor(red: 244/255, green: 246/255, blue: 248/255, alpha: 1)
    var codepathBlue = UIColor(red: 50/255, green: 68/255, blue: 82/255, alpha: 1)
    var codepathTurquise = UIColor(red: 74/255, green: 240/255, blue: 218/255, alpha: 1)
    var codepathPeach = UIColor(red: 255, green: 126, blue: 117, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        event = Event()


        eventHeaderView.headerImageView.image = event.headerImage
                
        tableView.backgroundColor = codepathPeach
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("EventCell") as! EventCell
        
        cell.eventDescriptionLabel.text = event.content
        
        
        return cell
    }
    
//    @IBAction func didDismiss(sender: AnyObject) {
//        
//        dismissViewControllerAnimated(true, completion: nil)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
