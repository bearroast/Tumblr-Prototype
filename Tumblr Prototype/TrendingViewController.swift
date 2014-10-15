//
//  TrendingViewController.swift
//  Tumblr Prototype
//
//  Created by Bjørn Eivind Rostad on 10/12/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var trendingImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //// Setting the scrollView to be the same size as trendingImageView
        scrollView.contentSize = trendingImageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
