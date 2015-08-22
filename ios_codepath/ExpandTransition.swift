//
//  ExpandTransition.swift
//  ios_codepath
//
//  Created by Patrick Weiss on 8/20/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class ExpandTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
       
        var feedViewController = fromViewController as! FeedViewController
        var eventViewController = toViewController as! EventViewController
        

// trying to identify the right from and to image to temporarily create and animate
//        var fromImage = feedViewController.selectedEventImageView
//        var toImageView = eventViewController.
        
        
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransformMakeScale(1, 1)
            }) { (finished: Bool) -> Void in
                self.finish()
        }

// not exactly sure how to temporarily create a window with the right image
//        var window = UIApplication.sharedApplication().keyWindow
//        var frame = window.convertRect(fromImage, fromView: containerView)
        
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        fromViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.transform = CGAffineTransformMakeScale(0.01, 0.01) 

            }) { (finished: Bool) -> Void in
                self.finish()
        }

    }
    
    
}
