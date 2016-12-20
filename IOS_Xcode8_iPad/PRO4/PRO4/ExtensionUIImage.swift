//
//  ExtensionUIImage.swift
//  PRO4
//
//  Created by Niu Panfeng on 8/2/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

extension UIImage
{
    func addWaterMarked(image:UIImage, opacity:CGFloat, margin:CGFloat) -> UIImage{
        
        let imgFrame = CGRectMake(0, 0, image.size.width, image.size.height)
        let posX = self.size.width - imgFrame.size.width - margin
        let posY = self.size.height - imgFrame.size.height - margin
        let targetFrame = CGRectMake(posX, posY, image.size.width, image.size.height)
        
        UIGraphicsBeginImageContext(self.size)
        self.drawInRect(CGRectMake(0, 0, self.size.width, self.size.height))
        image.drawInRect(targetFrame, blendMode: CGBlendMode.Normal, alpha: opacity)
        let warterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return warterMarkedImage
    }
    
    func blendColor(color: UIColor, blendMode: CGBlendMode) -> UIImage{
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height)
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        UIRectFill(rect)
        self.drawInRect(rect, blendMode: blendMode, alpha: 1.0)
        let blendedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return blendedImage
        
    }
}
