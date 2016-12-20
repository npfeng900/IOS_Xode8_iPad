//
//  ViewController.swift
//  MediaProject
//
//  Created by Niu Panfeng on 7/8/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "sexy")
        let grayImage = self.grayImage(image!)
        let scaleImage = self.scaleImage(grayImage, newSize: CGSizeMake(320,480))
        
        let imageView = UIImageView(image: scaleImage)
        imageView.center = CGPointMake(160,240)
        self.view.addSubview(imageView)
        
        
        let ciImage = CIImage(image: image!)
        
        let color = CIColor(red: 0.8, green: 0.6, blue: 0.4)
        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(color, forKey: kCIInputColorKey)
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        let outImage = filter?.outputImage
        
        imageView.image = UIImage(CIImage: outImage!)

        let filter2 = CIFilter(name: "CIHueAdjust")
        filter2?.setValue(3.14/2, forKey: kCIInputAngleKey)
        filter2?.setValue(ciImage, forKey: kCIInputImageKey)
        let outImage2 = filter2?.outputImage

        imageView.image = UIImage(CIImage: outImage2!)
        
        let filter3 = CIFilter(name: "CIPixellate")
        filter3?.setDefaults()
        filter3?.setValue(ciImage, forKey: kCIInputImageKey)
        let outImage3 = filter3?.outputImage
        
        imageView.image = UIImage(CIImage: outImage3!)
        
        
        let builtInFilters = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        for filter in builtInFilters
        {
            let filter = CIFilter(name: filter as String)
            let attributes = filter!.attributes
            print("[\(filter)]\n")
            print(attributes)
            print("\n======================================")
        }
        
        
        
        imageView.image = image
        
        if #available(iOS 8.0, *)
        {
            let blur = UIBlurEffect(style: UIBlurEffectStyle.Light)
            let blurView = UIVisualEffectView(effect: blur)
            blurView.frame = CGRectMake(80, 140, 130, 130)
            blurView.layer.cornerRadius = 40
            blurView.layer.masksToBounds = true
            imageView.addSubview(blurView)
        }
        else
        {
            print("UIBlurEffert is only availabel on IOS 8.0 or newer!")
        }
        
    }
    
    //变灰度图像
    func grayImage(image:UIImage)->UIImage{
        
        let imageSize = image.size
        let width = imageSize.width
        let height = imageSize.height
        
        let spaceRef:CGColorSpaceRef = CGColorSpaceCreateDeviceGray()!
        let context:CGContextRef = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, spaceRef, CGBitmapInfo.ByteOrderDefault.rawValue)!
    
        let rect = CGRectMake(0, 0, width, height)
       
        CGContextDrawImage(context, rect, image.CGImage)
        
        let grayImage = UIImage(CGImage: CGBitmapContextCreateImage(context)!)
        
        return grayImage
    }
    //缩放图像
    func scaleImage(image:UIImage, newSize:CGSize)->UIImage{
        
        let imageSize = image.size
        let widthFactor = newSize.width / imageSize.width
        let heightFactor = newSize.height / imageSize.height
        let scaleFator = ( widthFactor < heightFactor ) ? widthFactor : heightFactor
     
        let scaleWidth = imageSize.width * scaleFator
        let scaleHeight = imageSize.height * scaleFator

        
        UIGraphicsBeginImageContext(CGSizeMake(scaleWidth, scaleHeight))
        image.drawInRect(CGRectMake(0, 0, scaleWidth, scaleHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return newImage
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

