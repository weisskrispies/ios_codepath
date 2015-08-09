//
//  ClassmatesViewController.swift
//  Codepath 1
//
//  Created by Nan Chen on 8/3/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class ClassmatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    weak var classmatesViewController: ClassmatesViewController!
    
    let classMates = ["Tom Lee","Joe Spinach","Titan","Melissa Wong","Buns","General Tsao","Jackie Chan","Richard Long","Carson Daly","J Lo","Jessica Alba"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        headerView.layer.masksToBounds = true
//        headerView.layer.borderColor = UIColor.grayColor().CGColor;
//        headerView.layer.borderWidth = 1.0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classMates.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("classmatesTableViewCell") as! UITableViewCell
        
        cell.textLabel!.text = classMates[indexPath.row]
        
        var imageName = UIImage(named: classMates[indexPath.row])
        cell.imageView!.image = imageName
        
        return cell
    }
    
    @IBAction func onTapCell(sender: UITapGestureRecognizer) {
//        showClassmateDetails()
        performSegueWithIdentifier("classmatesTable2DetailSegue", sender: nil)
        println(classMates[1])

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        println("You selected cell #\(indexPath.row)!")
    }

    func showClassmateDetails() {
        // Here the detailsController and it's view are created and initiated
        var detailsController: classmateDetailViewController!
        
        let detailsWidth: CGFloat = view.bounds.width
        let detailsHeight: CGFloat = view.bounds.width
        
        detailsController = storyboard?.instantiateViewControllerWithIdentifier("details") as! classmateDetailViewController
        
        self.addChildViewController(detailsController)
        view.addSubview(detailsController.view)
        detailsController.didMoveToParentViewController(self)
    }

    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if (segue.identifier == "ClassmatesTable2DetailSegue") {
            var detailVC = segue!.destinationViewController as! classmateDetailViewController;
            detailVC.passName = classMates[1]
        }
    }
    

    


}
