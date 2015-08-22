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

    @IBOutlet var viewBackground: UIView!
    
    var event: Event!
    
    var backgroundImage: UIImage!

    var dismissEventViewController: Bool = false
    
    var backgroundGray = UIColor(red: 244/255, green: 246/255, blue: 248/255, alpha: 1)
    var codepathBlue = UIColor(red: 50/255, green: 68/255, blue: 82/255, alpha: 1)
    var codepathTurquise = UIColor(red: 74/255, green: 240/255, blue: 218/255, alpha: 1)
    var codepathPeach = UIColor(red: 255/255, green: 126/255, blue: 117/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        eventHeaderView.eventViewController = self

        eventHeaderView.headerImageView.image = event.headerImage
        eventHeaderView.eventTitleLabel.text = event.title
        eventHeaderView.eventBylineLabel.text = event.byline
//        eventHeaderView.eventMonthLabel.text = event.dateMonth
//        eventHeaderView.eventDayLabel.text = event.dateDay
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewBackground.backgroundColor = codepathPeach
        
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
    
    @IBAction func didTapToDismiss(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if abs(scrollView.contentOffset.y) >= 30 {
            finishDismissingPhoto()
        }
    }
    
    func finishDismissingPhoto() {
        dismissEventViewController = true
        dismissViewControllerAnimated(true, completion: { () -> Void in
            self.dismissEventViewController = false
        })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
