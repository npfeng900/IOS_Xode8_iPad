//
//  ViewController.swift
//  NetProject
//
//  Created by Niu Panfeng on 7/24/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var reachability:Reachability?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //testNet()
        /*
        let website = "http://www.coolketang.com"
        let url = NSURL(string: website)
        UIApplication.sharedApplication().openURL(url!)
        */
        /*
        let tel = "tel:18510574485"
        let url = NSURL(string: tel)
        UIApplication.sharedApplication().openURL(url!)
        */
        /*
        let sms = "sms:18510574485"
        let url = NSURL(string: sms)
        UIApplication.sharedApplication().openURL(url!)
        */
        /*
        let mailto = "mailto:npfeng900@163.com"
        let url = NSURL(string: mailto)
        UIApplication.sharedApplication().openURL(url!)
        */
        /*
        var address = "Beijing"
        address = address.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!
        let website = "http://maps.google.com/maps?q=\(address)"
        let url = NSURL(string: website)
        UIApplication.sharedApplication().openURL(url!)
        */
        
        let button = UIButton(frame: CGRectMake(40,80,240,44))
        button.setTitle("写邮件", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.purpleColor()
        button.addTarget(self, action: "sendEmail", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }

    func sendEmail(){
        let recipients = ["npfeng900@163.com"]
        let message = "<font color='blue'>Hi, can you give me your love</font>"
        //let attchedPic = UIImage(named: "sexy.jpg")
        //let imageData = UIImageJPEGRepresentation(attchedPic!, 0.9)
        
        let mailBox = MFMailComposeViewController()
        mailBox.mailComposeDelegate = self
        mailBox.setSubject("Love")
        mailBox.setMessageBody(message, isHTML: true)
        mailBox.setToRecipients(recipients)
        //mailBox.addAttachmentData(imageData!, mimeType: "", fileName: "sexy.jpg")
        
        
        self.presentViewController(mailBox, animated: true, completion: nil)
    }
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue
        {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail sent failure: \(error!.localizedDescription)")
        default:
            break
        }

        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func testNet(){
        do{
            try reachability = Reachability.reachabilityForInternetConnection()
        }
        catch{
            return
        }
        
        if reachability!.isReachable()
        {
            if reachability!.isReachableViaWiFi()
            {
                print("We are on WiFi.")
            }
            else if reachability!.isReachableViaWWAN()
            {
                print("We are on WWAN.")
            }
        }
        else
        {
            print("We are not reachable.")
        }
    }
    
    deinit{
        reachability?.stopNotifier()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

