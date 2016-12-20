//
//  ViewController.swift
//  Media2Project
//
//  Created by Niu Panfeng on 7/9/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageView = UIImageView(frame: CGRectMake(80, 80, 160, 240))
        imageView.image = UIImage(named: "mm")
        imageView.tag = 1
        self.view.addSubview(imageView)
        
        /*
        let animation = CATransition()
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.type = kCATransitionPush
        
        imageView.layer.addAnimation(animation, forKey: "Push")
        */
        
        let button = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(50, 400, 220, 44)
        button.backgroundColor = UIColor.lightGrayColor()
        button.setTitle("Tap", forState: UIControlState.Normal)
        button.addTarget(self, action: "playAnimation", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        var images = [UIImage]()
        for(var i = 1; i <= 13; i++)
        {
            images.append(UIImage(named: "DMNH100\(i)")!)
        }
        imageView.frame = CGRectMake(60, 110, 200, 200)
        imageView.animationImages = images
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        
    }
    func playAnimation(){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(5)
        UIView.setAnimationBeginsFromCurrentState(true)
        let view = self.view.viewWithTag(1)
        UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: view!, cache: true)
        view?.frame = CGRectMake(80, 80, 0, 0)
    
        UIView.setAnimationDelegate(self)
        //UIView.setAnimationDidStopSelector("animationStop")
        
        UIView.commitAnimations()
    }
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("Animation stop")
        self.view.viewWithTag(1)?.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

