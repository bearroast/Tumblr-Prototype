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
        
        var loading = UIImage.animatedImageNamed("loading-", duration: 0.5)
        loadingImageView.image = loading
        
        scrollView.contentSize = searchImageView.image!.size
        
        // Just realized the asset is too short to be scrolling so I'm doing a great job at wasting my own time :)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        delay(2, closure: { () -> () in
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.scrollView.alpha = 1
            })
        })
    }
    
    
    
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
