//
//  MyLabel.swift
//  CommonControlProject
//
//  Created by Niu Panfeng on 7/5/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class MyLabel: UILabel {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.font = UIFont(name: "Georgia", size: 20)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetTextDrawingMode(context, CGTextDrawingMode.Stroke)
        CGContextSetLineWidth(context, 2)
        CGContextSetLineJoin(context, CGLineJoin.Round)
        self.textColor = UIColor.whiteColor()
        super.drawTextInRect(rect)
        
        CGContextSetTextDrawingMode(context, CGTextDrawingMode.Fill)
        self.textColor = UIColor.blackColor()
        super.drawTextInRect(rect)
        
        
    }
    

}
