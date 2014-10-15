//
//  SearchViewController.swift
//  Tumblr Prototype
//
//  Created by Bjørn Eivind Rostad on 10/12/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var loadingImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.alpha = 0
        
        //// Using animatedImageNamed to find all pngs with "loading-" and loop through them
        var loading = UIImage.animatedImageNamed("loading-", duration: 0.6)
        loadingImageView.image = loading
        
        //// Just realized the asset is too short to be scrolling so I'm doing a great job at 
        //// wasting my own time by debuggin why this view didn't scroll:)
        scrollView.contentSize = searchImageView.image!.size
  
    }
    
    
    override func viewDidAppear(animated: Bool) {
        delay(2, closure: { () -> () in
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.scrollView.alpha = 1
            })
        })
    }
    
    
    //// Delay function to simulate the loading
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
