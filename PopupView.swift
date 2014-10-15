//
//  PopupView.swift
//  Tumblr Prototype
//
//  Created by Bjørn Eivind Rostad on 10/14/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

//// Instead of using a image, I've created a UIView class that (in the future) could be extended to fit all kinds of texts and background 
//// colors. Right now it only supports up to two lines of text.

class PopupView: UIView {
    
    //// Setting default text value
    var text: String = "default"
    
    //// Clearing bg color
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clearColor()
    }
    
    
    override func drawRect(rect: CGRect) {
        //// Here begins the code from PaintCode 2
        
        //// Color Declarations
        let color = UIColor(red: 0.836, green: 0.836, blue: 0.836, alpha: 1.000)
        
        //// Bezier Drawing
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(185, 8))
        bezierPath.addLineToPoint(CGPointMake(185, 58))
        bezierPath.addCurveToPoint(CGPointMake(177, 66), controlPoint1: CGPointMake(185, 62.42), controlPoint2: CGPointMake(181.42, 66))
        bezierPath.addLineToPoint(CGPointMake(102.49, 66))
        bezierPath.addCurveToPoint(CGPointMake(92.49, 78), controlPoint1: CGPointMake(99.98, 68.5), controlPoint2: CGPointMake(92.49, 78))
        bezierPath.addCurveToPoint(CGPointMake(82.49, 66), controlPoint1: CGPointMake(92.49, 78), controlPoint2: CGPointMake(84.99, 68.5))
        bezierPath.addLineToPoint(CGPointMake(8, 66))
        bezierPath.addCurveToPoint(CGPointMake(0, 58), controlPoint1: CGPointMake(3.58, 66), controlPoint2: CGPointMake(-0, 62.42))
        bezierPath.addLineToPoint(CGPointMake(0, 8))
        bezierPath.addCurveToPoint(CGPointMake(8, 0), controlPoint1: CGPointMake(0, 3.58), controlPoint2: CGPointMake(3.58, -0))
        bezierPath.addLineToPoint(CGPointMake(177, 0))
        bezierPath.addCurveToPoint(CGPointMake(185, 8), controlPoint1: CGPointMake(181.42, 0), controlPoint2: CGPointMake(185, 3.58))
        bezierPath.closePath()
        color.setFill()
        bezierPath.fill()
        
        
        //// Text Drawing
        let textRect = CGRectMake(10, 14, 165, 50)
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Center
        
        let textFontAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 16), NSForegroundColorAttributeName: UIColor.blackColor(), NSParagraphStyleAttributeName: textStyle]
        
        self.text.drawInRect(textRect, withAttributes: textFontAttributes);
        
    }
}


