//
//  ViewController.swift
//  Synchronous-Asynchronous3
//
//  Created by Niu Panfeng on 7/31/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.frame = CGRectMake(10, 40, 300, 400)
        self.view.addSubview(imageView)
        
        let picPath = "http://h.hiphotos.baidu.com/image/h%3D360/sign=d55c2dc81c178a82d13c79a6c602737f/6c224f4a20a446235e8d72669a22720e0cf3d76b.jpg"
        let picUrl = NSURL(string: picPath)
       
        let globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(globalQueue)
        {   () -> Void in
            
            let picData = NSData(contentsOfURL: picUrl!)
            let picture = UIImage(data: picData!)
            dispatch_async(dispatch_get_main_queue())
            {
               self.imageView.image = picture
            }
        }
        
        
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            for var i = 0; i < 4; i++
            {
                print("Talking something: \(i)")
                sleep(1)
            }
        }
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            for var i = 0; i < 4; i++
            {
                print("Watch TV: \(i)")
                sleep(1)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

