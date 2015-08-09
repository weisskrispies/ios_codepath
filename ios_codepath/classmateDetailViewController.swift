//
//  classmateDetailViewController.swift
//  Codepath 1
//
//  Created by Nan Chen on 8/3/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class classmateDetailViewController: UIViewController {

    @IBOutlet weak var overlayBackground: UIView!
    
    @IBOutlet weak var classmatePhotoImage: UIImageView!
    @IBOutlet weak var classmateName: UILabel!
    @IBOutlet weak var classmateJobTitle: UILabel!
    @IBOutlet weak var githubLabel: UILabel!
    @IBOutlet weak var githubUsername: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var achievementsLabel: UILabel!
    
    @IBOutlet weak var firstCard: UIView!
    @IBOutlet weak var secondCard: UIView!
    @IBOutlet weak var thirdCard: UIView!
    @IBOutlet weak var fourthCard: UIView!
    
    var passName: String!
    var passPhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstCard.layer.cornerRadius  = 10.0
        secondCard.layer.cornerRadius  = 10.0
        thirdCard.layer.cornerRadius  = 10.0
        fourthCard.layer.cornerRadius  = 10.0
        modalPresentationStyle = UIModalPresentationStyle.PageSheet

        overlayBackground.alpha = 0.4
        
        classmateName.text = passName
        println(passName)
        println(firstCard.center)
        println(secondCard.center)
        println(thirdCard.center)
        println(fourthCard.center)

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapClose(sender: UITapGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: {});
        
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
