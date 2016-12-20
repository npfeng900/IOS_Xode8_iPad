//
//  QuartzView.swift
//  PRO4
//
//  Created by Niu Panfeng on 8/4/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class QuartzView: UIView {
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetRGBFillColor(context, 1.0, 0.0, 1.0, 1.0)
        CGContextFillRect(context, rect)
        
        
        
        let rect2 = CGRectMake(40, 80, 240, 40)
        CGContextAddRect(context, rect2)
        
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
        
        
        
        let font = UIFont.boldSystemFontOfSize(32)
        let text:NSString = "Sexy"
        let rect3 = CGRectMake(50, 80, 80, 30)
        text.drawInRect(rect3, withAttributes: [NSFontAttributeName:font])
        
        
        
        let points = [CGPointMake(40, 200), CGPointMake(40, 300), CGPointMake(280, 300), CGPointMake(40, 200)]
        CGContextAddLines(context, points, 4)
        
        CGContextSetRGBStrokeColor(context, 1, 1, 1, 1)
        CGContextSetLineWidth(context, 5)
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextStrokePath(context)
        
    }
}
