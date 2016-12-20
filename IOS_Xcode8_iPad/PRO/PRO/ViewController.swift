//
//  ViewController.swift
//  PRO
//
//  Created by Niu Panfeng on 8/1/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        //读取Settings中信息
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let article = userDefaults.objectForKey("key_article")
        let visible = userDefaults.boolForKey("key_visible")
        let value = userDefaults.floatForKey("key_value")
        print("article:\(article)")
        print("visible:\(visible)")
        print("value:\(value)")
        */
        
        //通知中心
        let localNotification = UILocalNotification()
        localNotification.fireDate = NSDate().dateByAddingTimeInterval(5)
        localNotification.repeatInterval = NSCalendarUnit.init(rawValue: 0)
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.alertBody = "Hi, it's time to make a decision!"
        localNotification.applicationIconBadgeNumber = 1;
        
        let infoDic = NSDictionary(object: "The Value of infoKey", forKey: "infoKey")
        localNotification.userInfo = infoDic as [NSObject : AnyObject]
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        print(infoDic)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

