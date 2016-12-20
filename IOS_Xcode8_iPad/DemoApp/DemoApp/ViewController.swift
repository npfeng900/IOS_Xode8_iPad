//
//  ViewController.swift
//  DemoApp
//
//  Created by Niu Panfeng on 6/19/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //风火轮
        UIApplication.sharedApplication().networkActivityIndicatorVisible=true;
        //加载图片
        //self.AddImageView("iPhone4S_small")
        
        /*图片作为纹理
        let image = UIImage(named: "handsome.jpeg")
        let patternColor = UIColor.init(patternImage:image!)
        self.view.backgroundColor=patternColor
        */
        
        
        /*
        let gradientView = UIView(frame: CGRectMake(60, 40, 200, 400))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame=CGRectMake(0, 0, 200, 300)
        gradientLayer.colors = [UIColor.yellowColor().CGColor, UIColor.redColor().CGColor, UIColor.purpleColor().CGColor]
        gradientView.layer.addSublayer(gradientLayer)
        //旋转仿射变换
        //gradientView.transform=CGAffineTransformRotate(gradientView.transform, 3.14/4)
        self.view.addSubview(gradientView)
        */
        
       
        
        
        /*
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        //显示图像
        imageView.image = UIImage(named: "handsome_2")
        //显示区域
        imageView.frame = CGRectMake(60, 40, 200, 400)
        //边框
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        //阴影颜色
        imageView.layer.shadowColor = UIColor.blackColor().CGColor
        imageView.layer.shadowOffset = CGSize(width: 20.0, height: 20.0)
        imageView.layer.shadowOpacity=0.5
        imageView.layer.shadowRadius=5
        //圆角
        //imageView.layer.cornerRadius = 100
        //imageView.layer.masksToBounds = true
        //交互动作
        imageView.userInteractionEnabled = true
        
        //let guestureSingleTap = UITapGestureRecognizer(target: self, action: "SingleTap")
        let guestureLongPress = UILongPressGestureRecognizer(target: self, action: "LongPress:")
        let guestureDoubleTap = UITapGestureRecognizer(target: self, action: "DoubleTap")
        guestureDoubleTap.numberOfTapsRequired = 2
        guestureDoubleTap.numberOfTouchesRequired = 1
        //imageView.addGestureRecognizer(guestureSingleTap)
        imageView.addGestureRecognizer(guestureLongPress)
        imageView.addGestureRecognizer(guestureDoubleTap)
        */
        
        

        
        //UIView相关
        let view = UIView(frame: CGRectMake(40, 50, 200, 200))
        view.backgroundColor = UIColor.brownColor()
        self.view.addSubview(view)
        
        let btAdd = UIButton(frame: CGRectMake(30,350,80,30))
        btAdd.backgroundColor = UIColor.grayColor()
        btAdd.setTitle("Add", forState: UIControlState.Normal)
        btAdd.addTarget(self, action: "addView:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btAdd)
        
        let btBack = UIButton(frame: CGRectMake(120,350,80,30))
        btBack.backgroundColor = UIColor.grayColor()
        btBack.setTitle("Switch", forState: UIControlState.Normal)
        btBack.addTarget(self, action: "bringViewBack:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btBack)
        
        let btRemove = UIButton(frame: CGRectMake(210,350,80,30))
        btRemove.backgroundColor = UIColor.grayColor()
        btRemove.setTitle("Remove", forState: UIControlState.Normal)
        btRemove.addTarget(self, action: "removeView:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btRemove)
        

        
        
        
        /*IOS配置信息
        let mainBundle = NSBundle.mainBundle()
        let idetifier  = mainBundle.bundleIdentifier
        let info       = mainBundle.infoDictionary
        let CFBundleName = mainBundle.objectForInfoDictionaryKey("CFBundleName")
        let version    = mainBundle.objectForInfoDictionaryKey("CFBundleShortVersionString")
        
        print("[identifier]:\(idetifier)\n")
        print("[CFBundleName]:\(CFBundleName)\n")
        print("[version]:\(version)\n")
        print("[info]:\(info)\n")
        */
        
        /*控制台输出
        print("It's a print")
        debugPrint("It's a debugPrint")
        CFShow("It's a CFshow")
        
        let position=(x:10.5,y:20)
        dump(position)
        
        let str="Xcode!"
        print("Hello "+str)
        print("Hello \(str)")
        */

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addView(sender:UIButton!)
    {
        let view = UIView(frame: CGRectMake(50,60,200,200))
        view.backgroundColor = UIColor.purpleColor()
        view.tag = 1
        
        self.view.addSubview(view)
    }
    
    func bringViewBack(sender:UIButton!)
    {
        let view = self.view.viewWithTag(1)
        self.view.sendSubviewToBack(view!)
    }
    
    func removeView(sender:UIButton!)
    {
        let view = self.view.viewWithTag(1)
        view?.removeFromSuperview()
    }
    
    func AddImageView(imgName:String) {
        let img=UIImage(named: imgName);
        let imgView=UIImageView(image:img);
        self.view.addSubview(imgView);
    }
    
    func SingleTap(){
        let alertView = UIAlertController(title: "信息", message: "刚才大爷我单击了，咋地！", preferredStyle: UIAlertControllerStyle.Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler:{(action) in} )
        
        alertView.addAction(OKAction)
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    func LongPress(x:UILongPressGestureRecognizer){
        if(x.state == UIGestureRecognizerState.Began)
        {
            let alertView = UIAlertController(title: "Message", message: "刚才我长按了啊！", preferredStyle: UIAlertControllerStyle.Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler:{(action) in} )
            alertView.addAction(OKAction)
            self.presentViewController(alertView, animated: true, completion: nil)
            
        }
    }
    
    func DoubleTap(){
        let alertView = UIAlertController(title: "信息", message: "刚才大爷我又双击了！", preferredStyle: UIAlertControllerStyle.Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler:{(action) in} )
        
        alertView.addAction(OKAction)
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    

}

