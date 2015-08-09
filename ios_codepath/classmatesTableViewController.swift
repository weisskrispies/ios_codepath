//
//  classmatesTableViewController.swift
//  Codepath 1
//
//  Created by Nan Chen on 8/3/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class classmatesTableViewController: UITableViewController {

    let classMates = ["Tom Lee","Joe Spinach","Titan","Melissa Wong","Buns","General Tsao","Jackie Chan","Richard Long","Carson Daly","J Lo","Jessica Alba"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classMates.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("classmatesCell") as! UITableViewCell
        
        cell.textLabel!.text = classMates[indexPath.row]
        
        var imageName = UIImage(named: classMates[indexPath.row])
        cell.imageView!.image = imageName
        
        return cell
    }
    
    @IBAction func onTapCell(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("ClassmatesTable2DetailSegue", sender: nil)
        
    }
    
    //    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
    //        if (segue.identifier == "card2DetailSegue") {
    //            //Checking identifier is crucial as there might be multiple
    //            // segues attached to same view
    //            var detailVC = segue!.destinationViewController as! ClassmateDetailViewController;
    //            detailVC.passName = cardNameLabel[\(indexPath.row)].text
    //            
    //            detailVC.classmatesTableViewController = self
    //        }

}
