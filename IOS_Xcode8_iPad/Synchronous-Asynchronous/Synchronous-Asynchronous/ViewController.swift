//
//  ViewController.swift
//  Synchronous-Asynchronous
//
//  Created by Niu Panfeng on 7/24/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDownloadDelegate {
    
    //var label = UILabel()
    var backgroundView:UIView = UIView()
    var foregroundView:UIView = UIView()
    var progressLabel:UILabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        label.frame = CGRectMake(20, 40, 280, 80)
//        label.text = "Loading..."
//        label.font = UIFont(name: "Arial", size: 12)
//        label.backgroundColor = UIColor.lightGrayColor()
//        label.numberOfLines = 0
//        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        self.view.addSubview(label)
//        
//        let url:NSURL! = NSURL(string: "http://gc.ditu.aliyun.com/geocoding?a=NewYork")
//        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(request) { (data:NSData?, response:NSURLResponse?, error:NSError?)  in
//            if(error != nil)
//            {
//                print(error?.code)
//                print(error?.description)
//            }
//            else
//            {
//                let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                self.label.text = String(str)
//            }
//        } as NSURLSessionTask
//        task.resume()
        
      
        
        /*
        let urlImage:NSURL! = NSURL(string: "http://i7.itc.cn/20090701/54a_80a1f8e0_0c01_49cc_806b_343b15eba601_0.jpg")
        let requestImage:NSURLRequest = NSURLRequest(URL: urlImage)
        let sessionImage = NSURLSession.sharedSession()
        let taskImage = sessionImage.downloadTaskWithRequest(requestImage, completionHandler:
            { (path:NSURL?, response:NSURLResponse?, error:NSError?) -> Void in
                do{
                    let originalPath = path!.path
                    print("Original Path:\(originalPath!)")
                    let targetPath:String = NSHomeDirectory() + "/Documents/music.jpg"
                    print("Target   Path:\(targetPath)")
                    
                    let fileManager:NSFileManager = NSFileManager.defaultManager()
                    try fileManager.moveItemAtPath(originalPath!, toPath: targetPath)
                }
                catch{
                    print("Network error!!!.")
                }
            }
        )
        taskImage.resume()
        */
        
        
//        let url:NSURL! = NSURL(string: "http://ip.taobao.com/service/getIpInfo.php?ip=125.75.196.246")
//        let request = NSMutableURLRequest.init(URL: url, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 30)
//        request.HTTPMethod = "POST"
        
//        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
//        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
//           
//            if(error != nil)
//            {
//                print("Network Error!")
//            }
//            else
//            {
//                if let d = data
//                {
//                    let str = NSString(data: d, encoding: NSUTF8StringEncoding)
//                    self.label.text = String(str)
//                }
//                
//            }
//            
//        });
//        
//        task.resume()
        
       
        /*
        do{
            
            var response:NSURLResponse?
            let data:NSData? = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            
            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            self.label.text = String(str)
        }
        catch{
            print("Network Error!")
        }

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if(error != nil)
            {
                print("Network Error!")
            }
            else
            {
                let str = NSString(data: data!, encoding: 1)
                print(str)
            }
        }
        */
        
        /*
        backgroundView.frame = CGRectMake(16, 106, 288, 44)
        backgroundView.backgroundColor = UIColor.lightGrayColor()
        foregroundView.frame = CGRectMake(20, 110, 0, 36)
        foregroundView.backgroundColor = UIColor.greenColor()
        progressLabel.frame = CGRectMake(20, 160, 200, 36)
        progressLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(backgroundView)
        self.view.addSubview(foregroundView)
        self.view.addSubview(progressLabel)
        
        let url:NSURL! = NSURL(string: "http://i7.itc.cn/20090701/54a_80a1f8e0_0c01_49cc_806b_343b15eba601_0.jpg")
        let request:NSURLRequest = NSURLRequest(URL: url)
        let session = self.buildSession() as NSURLSession
        let task = session.downloadTaskWithRequest(request)
        task.resume()
        */
        
        let url:NSURL! = NSURL(string: "http://coolketang.com/")
        let request:NSURLRequest = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        
        let image = NSHomeDirectory() + "/Documents/kaka.jpg"
        let imgData = NSData(contentsOfFile: image)
        
        let task = session.uploadTaskWithRequest(request, fromData: imgData) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            print("Uploading Finished")
        }
        task.resume()
        
    }

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        do{
            let originalPath = location.path
            print("Original Path:\(originalPath!)")
            let targetPath:String = NSHomeDirectory() + "/Documents/kaka.jpg"
            
            let fileManager:NSFileManager = NSFileManager.defaultManager()
            if !fileManager.fileExistsAtPath(targetPath)
            {
                try fileManager.moveItemAtPath(originalPath!, toPath: targetPath)
                print("Target   Path:\(targetPath)")
            }
        }
        catch{
            print("Network error!!!.")
        }
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let rate:CGFloat = CGFloat(totalBytesWritten)/CGFloat(totalBytesExpectedToWrite)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.foregroundView.frame.size.width = rate * 280
            if rate == 1.0
            {
                self.progressLabel.text = "Finished 😋"
            }
        }
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        print(fileOffset)
    }
    
    func buildSession() -> NSURLSession {
        
        var predicate:dispatch_once_t = 0
        var session:NSURLSession? = nil
        
        dispatch_once(&predicate) { () -> Void in
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            session = NSURLSession(configuration: config, delegate: self, delegateQueue: nil)
        }
        return session!
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

