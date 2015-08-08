//
//  ProfileViewController.swift
//  codepath_app
//
//  Created by Jules Walter on 8/1/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var githubLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var rows: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImageView.image = UIImage(named:"profile_photo")
        tableView.delegate = self
        tableView.dataSource = self
        
        rows = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSettings(sender: UIButton) {
        
        let settingsMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let editProfileAction = UIAlertAction(title: "Edit Profile", style: .Default) { (alert: UIAlertAction!) -> Void in
            //present edit profile screen
        self.performSegueWithIdentifier("editProfileSegue", sender: nil)
        }
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .Default) { (alert: UIAlertAction!) -> Void in
            // TBD
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alert: UIAlertAction!) -> Void in
            //
        }
        
        settingsMenu.addAction(editProfileAction)
        settingsMenu.addAction(signOutAction)
        settingsMenu.addAction(cancelAction)
        
        self.presentViewController(settingsMenu, animated: true, completion: nil)
    }
    
    @IBAction func didPressClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Achievements"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CourseCell") as! CourseCell
        
        UIImage(named: "class_icon")
        cell.badgeImageView.image = UIImage(named: "class_icon")
        cell.courseTitleLabel.text = "iOS for Designers"
        cell.currentWeekLabel.text = "2"
        cell.maxWeekLabel.text = "8"
        
        return cell
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
