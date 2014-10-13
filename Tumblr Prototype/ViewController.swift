//
//  ViewController.swift
//  Tumblr Prototype
//
//  Created by Bjørn Eivind Rostad on 10/10/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!

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
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        containerView.addSubview(homeViewController.view)
        
        homeButton.selected = true
        
        
    }

    @IBAction func onTabBarButton(sender: UIButton) {

        selectedButton = sender as UIButton
        
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        
        selectedButton.selected = true
        
        var tabBarButton = selectedButton
        
        if tabBarButton == homeButton {
            self.addChildViewController(homeViewController)
            containerView.addSubview(homeViewController.view)
            homeViewController.didMoveToParentViewController(self)
            println("Home")

        } else if tabBarButton == searchButton {
            self.addChildViewController(searchViewController)
            containerView.addSubview(searchViewController.view)
            searchViewController.didMoveToParentViewController(self)
            println("Search")
            
        } else if tabBarButton == accountButton {
            self.addChildViewController(accountViewController)
            containerView.addSubview(accountViewController.view)
            accountViewController.didMoveToParentViewController(self)
            println("Account")
            
        } else if tabBarButton == trendingButton {
            self.addChildViewController(trendingViewController)
            containerView.addSubview(trendingViewController.view)
            trendingViewController.didMoveToParentViewController(self)
            println("Trending")
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

