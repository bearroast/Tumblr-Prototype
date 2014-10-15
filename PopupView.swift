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
        bezierPath.moveToPoint(CGPointMake(167.32, 0.26))
        bezierPath.addLineToPoint(CGPointMake(167.47, 0.3))
        bezierPath.addCurveToPoint(CGPointMake(169.7, 2.53), controlPoint1: CGPointMake(168.51, 0.68), controlPoint2: CGPointMake(169.32, 1.49))
        bezierPath.addCurveToPoint(CGPointMake(170, 6.11), controlPoint1: CGPointMake(170, 3.47), controlPoint2: CGPointMake(170, 4.35))
        bezierPath.addLineToPoint(CGPointMake(170, 57.89))
        bezierPath.addCurveToPoint(CGPointMake(169.74, 61.32), controlPoint1: CGPointMake(170, 59.65), controlPoint2: CGPointMake(170, 60.53))
        bezierPath.addLineToPoint(CGPointMake(169.7, 61.47))
        bezierPath.addCurveToPoint(CGPointMake(167.47, 63.7), controlPoint1: CGPointMake(169.32, 62.51), controlPoint2: CGPointMake(168.51, 63.32))
        bezierPath.addCurveToPoint(CGPointMake(163.89, 64), controlPoint1: CGPointMake(166.53, 64), controlPoint2: CGPointMake(165.65, 64))
        bezierPath.addLineToPoint(CGPointMake(91.31, 64))
        bezierPath.addCurveToPoint(CGPointMake(85.31, 70), controlPoint1: CGPointMake(88.38, 66.94), controlPoint2: CGPointMake(85.31, 70))
        bezierPath.addCurveToPoint(CGPointMake(79.31, 64), controlPoint1: CGPointMake(85.31, 70), controlPoint2: CGPointMake(82.25, 66.94))
        bezierPath.addLineToPoint(CGPointMake(6.11, 64))
        bezierPath.addCurveToPoint(CGPointMake(2.68, 63.74), controlPoint1: CGPointMake(4.35, 64), controlPoint2: CGPointMake(3.47, 64))
        bezierPath.addLineToPoint(CGPointMake(2.53, 63.7))
        bezierPath.addCurveToPoint(CGPointMake(0.3, 61.47), controlPoint1: CGPointMake(1.49, 63.32), controlPoint2: CGPointMake(0.68, 62.51))
        bezierPath.addCurveToPoint(CGPointMake(0, 57.89), controlPoint1: CGPointMake(0, 60.53), controlPoint2: CGPointMake(0, 59.65))
        bezierPath.addLineToPoint(CGPointMake(0, 6.11))
        bezierPath.addCurveToPoint(CGPointMake(0.26, 2.68), controlPoint1: CGPointMake(0, 4.35), controlPoint2: CGPointMake(-0, 3.47))
        bezierPath.addLineToPoint(CGPointMake(0.3, 2.53))
        bezierPath.addCurveToPoint(CGPointMake(2.53, 0.3), controlPoint1: CGPointMake(0.68, 1.49), controlPoint2: CGPointMake(1.49, 0.68))
        bezierPath.addCurveToPoint(CGPointMake(6.11, 0), controlPoint1: CGPointMake(3.47, 0), controlPoint2: CGPointMake(4.35, 0))
        bezierPath.addLineToPoint(CGPointMake(163.89, 0))
        bezierPath.addCurveToPoint(CGPointMake(167.32, 0.26), controlPoint1: CGPointMake(165.65, 0), controlPoint2: CGPointMake(166.53, -0))
        bezierPath.closePath()
        color.setFill()
        bezierPath.fill()
        
        
        //// Text Drawing
        let textRect = CGRectMake(2, 14, 165, 50)
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.Center
        
        let textFontAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: 15), NSForegroundColorAttributeName: UIColor.blackColor(), NSParagraphStyleAttributeName: textStyle]
        
        
        text.drawInRect(textRect, withAttributes: textFontAttributes);
    }
}


