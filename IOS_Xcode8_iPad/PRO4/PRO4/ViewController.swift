//
//  ViewController.swift
//  PRO4
//
//  Created by Niu Panfeng on 8/2/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        //截屏
        let image = UIImage(named: "hot")
        let backgroundColor = UIColor(patternImage: image!)
        self.view.backgroundColor = backgroundColor
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        self.view.layer.renderInContext(context!)
        let contextImage = UIGraphicsGetImageFromCurrentImageContext()
        UIImageWriteToSavedPhotosAlbum(contextImage, self, nil, nil)
        UIGraphicsEndImageContext()
        */
        /*
        //添加水印
        var sourceImage = UIImage(named: "hot")
        let waterMarkImage = UIImage(named: "yellowDuck")
        sourceImage = sourceImage!.addWaterMarked(waterMarkImage!, opacity: 0.7, margin: 0)
        
        let imageView = UIImageView(image: sourceImage)
        self.view.addSubview(imageView)
        */
        /*
        //渲染模式
        let originalImageView = UIImageView()
        originalImageView.frame = CGRectMake(128, 60, 64, 64)
        originalImageView.image = UIImage(named: "head")
        self.view.addSubview(originalImageView)
        
        let brownOne = UIImageView()
        brownOne.frame = CGRectMake(128, 140, 64, 64)
        brownOne.image = UIImage(named: "head")?.blendColor(UIColor.yellowColor(), blendMode: CGBlendMode.Saturation)
        self.view.addSubview(brownOne)
        
        let redOne = UIImageView()
        redOne.frame = CGRectMake(128, 220, 64, 64)
        redOne.image = UIImage(named: "head")?.blendColor(UIColor.redColor(), blendMode: CGBlendMode.Saturation)
        self.view.addSubview(redOne)
        
        let greenOne = UIImageView()
        greenOne.frame = CGRectMake(128, 300, 64, 64)
        greenOne.image = UIImage(named: "head")?.blendColor(UIColor.greenColor(), blendMode: CGBlendMode.Saturation)
        self.view.addSubview(greenOne)
        */
        /*
        //面部识别
        let image = UIImage(named: "grils")
        
        let imgView = UIImageView()
        imgView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        imgView.image = image
        imgView.center = CGPointMake(160, 240)
        self.view.addSubview(imgView)
        
        let ciImage = CIImage(image: image!)
        
        let ciImageSize = ciImage!.extent.size
        var transform = CGAffineTransformIdentity
        transform = CGAffineTransformScale(transform, 1, -1)
        transform = CGAffineTransformTranslate(transform, 0, -ciImageSize.height)
       
        let ciContext: CIContext = {return CIContext(options: nil)}()
        let ciDetector = CIDetector(ofType: CIDetectorTypeFace, context: ciContext, options: [CIDetectorAccuracy : CIDetectorAccuracyHigh])
        let features: [CIFeature]! = ciDetector.featuresInImage(ciImage!)
        for features in features
        {
            let frame = CGRectApplyAffineTransform(features.bounds, transform)
            let faceView = UIView(frame: frame)
            faceView.layer.borderWidth = 2
            faceView.layer.borderColor = UIColor.whiteColor().CGColor
            
            imgView.addSubview(faceView)
        }
        */
        /*
        //画图
        let rect = self.view.bounds
        let view = QuartzView()
        view.frame = rect
        self.view.addSubview(view)
        */
        /*
        //动画
        let imageView = UIImageView()
        imageView.frame = CGRectMake(40, 80, 64, 64)
        imageView.image = UIImage(named: "head")
        self.view.addSubview(imageView)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        let point1 = CGPointMake(40, 80)
        let point2 = CGPointMake(280, 80)
        let point3 = CGPointMake(60, 300)
        let point4 = CGPointMake(280, 300)
        animation.values = [NSValue(CGPoint: point1), NSValue(CGPoint: point2), NSValue(CGPoint: point3), NSValue(CGPoint: point4)]
        animation.keyTimes = [NSNumber(float: 0.0), NSNumber(float: 0.1), NSNumber(float: 0.8), NSNumber(float: 1.0)]
        animation.delegate = self
        animation.duration = 20.0
        
        imageView.layer.addAnimation(animation, forKey: "Move")
        */
    }
    
    override func animationDidStart(anim: CAAnimation) {
        print("Start.")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("Stop.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

