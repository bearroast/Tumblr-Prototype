//
//  ViewController.swift
//  Tumblr Prototype
//
//  Created by Bjørn Eivind Rostad on 10/10/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var exploreView: PopupView!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var selectedButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //// Adding the views from the storyboard
        var storyboard = UIStoryboard(name: "Main", bundle: nil)

        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        

        //// Setting Home tab to be selected when opening the app
        containerView.addSubview(homeViewController.view)
        homeButton.selected = true
        
        
        self.exploreView.text = "Use the Explore tab to find blogs to follow."
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.2,options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.exploreView.transform = CGAffineTransformMakeTranslation(0, -3)
        }, completion: nil)
        
        
    }


    //// Tab bar buttons
    
    @IBAction func onTabBarButton(sender: UIButton) {

        selectedButton = sender as UIButton
        
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        
        selectedButton.selected = true
        
        var tabBarButton = selectedButton
        
        
        //// Adding subviews from the tabs
        if tabBarButton == homeButton {
            self.addChildViewController(homeViewController)
            containerView.addSubview(homeViewController.view)
            homeViewController.didMoveToParentViewController(self)
            self.exploreView.alpha = 1

            println("Home")

        } else if tabBarButton == searchButton {
            self.addChildViewController(searchViewController)
            containerView.addSubview(searchViewController.view)
            searchViewController.didMoveToParentViewController(self)
            self.exploreView.alpha = 0
            println("Search")
            
        } else if tabBarButton == accountButton {
            self.addChildViewController(accountViewController)
            containerView.addSubview(accountViewController.view)
            accountViewController.didMoveToParentViewController(self)
            self.exploreView.alpha = 1

            println("Account")
            
        } else if tabBarButton == trendingButton {
            self.addChildViewController(trendingViewController)
            containerView.addSubview(trendingViewController.view)
            trendingViewController.didMoveToParentViewController(self)
            self.exploreView.alpha = 1

            println("Trending")
            
        }
    }
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
        
        
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.8
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            let vc = toViewController as ComposeViewController
            
            //// Setting the buttons outside of the view
            vc.textButton.transform = CGAffineTransformMakeTranslation(0, 568)
            vc.photoButton.transform = CGAffineTransformMakeTranslation(0, 568)
            vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, 568)
            vc.linkButton.transform = CGAffineTransformMakeTranslation(0, 568)
            vc.chatButton.transform = CGAffineTransformMakeTranslation(0, 568)
            vc.videoButton.transform = CGAffineTransformMakeTranslation(0, 568)
            vc.cancelButton.transform = CGAffineTransformMakeTranslation(0, 568)
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            toViewController.view.backgroundColor = UIColor(red:0.2, green:0.25, blue:0.33, alpha:0.9)
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    
                    //// Animate buttons to the view using the a default value of SpringWithDamping: 0.7, initialSpringVelocity: 0.2
                    //// Buttons should animate in at different delays
                    self.springWithDelay(0.4, delay: 0.16, {
                        vc.textButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, nil)
                    
                    self.springWithDelay(0.4, delay: 0.0, {
                        vc.photoButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, nil)
                    
                    self.springWithDelay(0.4, delay: 0.16, {
                        vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, nil)
                    
                    self.springWithDelay(0.4, delay: 0.34, {
                        vc.linkButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, nil)
                    
                    self.springWithDelay(0.4, delay: 0.22, {
                        vc.chatButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, nil)
                    
                    self.springWithDelay(0.4, delay: 0.4, {
                        vc.videoButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, nil)
                    
                    
                    //// Cancel button has no delay or spring
                    UIView.animateWithDuration(0.42, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
                        vc.cancelButton.transform = CGAffineTransformMakeTranslation(0, 0)
                    }, completion: nil )
                    
                    
                    
                    transitionContext.completeTransition(true)
            }
        } else {
            
                let vc = fromViewController as ComposeViewController

                //// Animate buttons to the view using the a default value of SpringWithDamping: 0.7, initialSpringVelocity: 0.2
                //// Buttons should animate in at different delays
                self.springWithDelay(0.4, delay: 0.16, {
                    vc.textButton.transform = CGAffineTransformMakeTranslation(0, -400)
                    }, nil)
            
                self.springWithDelay(0.4, delay: 0.0, {
                    vc.photoButton.transform = CGAffineTransformMakeTranslation(0, -400)
                    }, nil)
            
                self.springWithDelay(0.4, delay: 0.16, {
                    vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, -400)
                    }, nil)
            
                self.springWithDelay(0.4, delay: 0.34, {
                    vc.linkButton.transform = CGAffineTransformMakeTranslation(0, -400)
                    }, nil)

                self.springWithDelay(0.4, delay: 0.22, {
                    vc.chatButton.transform = CGAffineTransformMakeTranslation(0, -400)
                    }, nil)
            
                self.springWithDelay(0.4, delay: 0.4, {
                    vc.videoButton.transform = CGAffineTransformMakeTranslation(0, -400)
                    }, nil)
            
                UIView.animateWithDuration(0.5, delay: 0.4, options: nil, animations: { () -> Void in
                    fromViewController.view.alpha = 0
                    }, completion: { (finished: Bool) -> Void in
                        transitionContext.completeTransition(true)
                        fromViewController.view.removeFromSuperview()
                })
        }
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    //// Function for standardizing the spring
    func springWithDelay(duration: NSTimeInterval, delay: NSTimeInterval, animations: (() -> Void)!, completion: ((Bool) -> Void)!) {
            UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: nil, animations: {
                    animations()
                }, nil )
    }
}

