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
        "In this workshop we will focus on learning the debugging concepts, approaches, and tools used by professional app developers in day-to-day work."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return banners.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("FeedCell") as! FeedCell
        
        // Set feed cells based on arrays above
        cell.feedImageView.image = UIImage(named: banners[indexPath.row])
        cell.feedTitleLabel.text = titles[indexPath.row]
        cell.feedDescriptionLabel.text = descriptions[indexPath.row]
        println(cell.frame.size)
        //cell.contentView.frame = cell.bounds
        //cell.contentView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        
        
        return cell
        
    }
    
}

