//
//  ViewController.swift
//  Synchronous-Asynchronous2
//
//  Created by Niu Panfeng on 7/31/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stillLoading = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        let app = IOSApp()
        if app.respondsToSelector("printInformation")
        {
            app.performSelector("printInformation")
        }
        if app.respondsToSelector("buyApp:")
        {
            app.performSelector("buyApp:", withObject: "Freya")
            app.performSelector("buyApp:", withObject: "Sexy", afterDelay: 2)
        }
        */
        /*
        let label = UILabel(frame: CGRectMake(100, 100, 100, 30))
        label.text = "Watching"
        label.tag = 1
        self.view.addSubview(label)
        
        self.performSelector("threadEvent", withObject: nil, afterDelay: 0.0)
        */
        
        //NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "eat:", userInfo: "Apple", repeats: true)
        
        NSThread.sleepForTimeInterval(2)
        let view = UIView(frame: CGRectMake(40,80,240,100))
        view.backgroundColor = UIColor.brownColor()
        self.view.addSubview(view)
        
    }
    func eat(timer:NSTimer){
        let parameter:AnyObject! = timer.userInfo
        print("I'm eating \(parameter).")
    }
    
    func threadEvent(){
        self.performSelector("workInBackground", withObject: nil, afterDelay: 2.0)
        while stillLoading
        {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate.distantFuture())
        }
        self.view.viewWithTag(1)?.hidden = true
    }
    func workInBackground(){
        print(">>>>>>>>>>>>>")
        stillLoading = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

