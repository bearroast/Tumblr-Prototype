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
        
        var homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        var searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        var composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        var accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        var trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        containerView.addSubview(homeViewController.view)
        
        homeButton.selected = true
        
        
    }

    @IBAction func onTabBarButton(sender: UIButton) {
        
        selectedButton = sender as UIButton
        
        var selectedTab = selectedButton
        if selectedTab == homeButton {
            println("Home")
        } else if selectedTab == searchButton {
            println("Search")
        } else if selectedTab == accountButton {
            println("Account")
        } else if selectedTab == trendingButton {
            println("Trending")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

