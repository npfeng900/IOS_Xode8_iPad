//
//  ViewController.swift
//  CommonControlProject
//
//  Created by Niu Panfeng on 7/5/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*---------------------------------------
        let bt1 = UIButton()
        bt1.frame = CGRectMake(130, 80, 80, 80)
        //bt1.layer.borderWidth = 2
        //bt1.layer.borderColor = UIColor.blackColor().CGColor
        bt1.setBackgroundImage(UIImage(named: "button"), forState: UIControlState.Normal)
        self.view.addSubview(bt1)
        */
        /*---------------------------------------
        let bt2 = UIButton(type: UIButtonType.RoundedRect)
        bt2.frame = CGRectMake(80, 180, 150, 44)
        bt2.backgroundColor = UIColor.purpleColor()
        bt2.tintColor = UIColor.yellowColor()
        bt2.setTitle("Tap Me", forState: UIControlState.Normal)
        bt2.addTarget(self, action: "buttonTap:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bt2)
        */
        /*---------------------------------------
        let bt3 = UIButton(type: UIButtonType.RoundedRect)
        bt3.frame = CGRectMake(80, 280, 150, 44)
        bt3.backgroundColor = UIColor.brownColor()
        bt3.tintColor = UIColor.whiteColor()
        bt3.setTitle("Tap Me", forState: UIControlState.Normal)
        bt3.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        bt3.titleLabel?.font = UIFont(name: "Arial", size: 24)
        bt3.layer.masksToBounds = true
        bt3.layer.cornerRadius = 10
        bt3.layer.borderWidth = 4
        bt3.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.view.addSubview(bt3)
        */
        
        /*---------------------------------------
        let label = UILabel(frame: CGRectMake(20, 100, 128, 128))
        label.text = "Sexy Girls! Sexy Wife!"
        label.font = UIFont(name: "Arial", size: 24)
        label.shadowColor = UIColor.darkGrayColor()
        label.shadowOffset = CGSizeMake(2, 2)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.cyanColor()
        label.backgroundColor = UIColor.yellowColor()
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 0
        */
        /*---------------------------------------
        let label = MyLabel()
        label.frame = CGRectMake(40, 180, 240, 120)
        label.text = "Sexy Girls! Sexy Wife!"
        
        self.view.addSubview(label)
        self.view.backgroundColor = UIColor.purpleColor()
        */
        
        /*---------------------------------------

        
        let uiSwitch = UISwitch(frame: CGRectMake(130, 100, 0, 0))
        uiSwitch.setOn(true, animated: true)
        uiSwitch.addTarget(self, action: "switchChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(uiSwitch)
        */
        
        /*---------------------------------------
        let label = UILabel(frame: CGRectMake(80,100,100,30))
        label.text = "0"
        label.tag = 1
        self.view.addSubview(label)

        let stepper = UIStepper(frame: CGRectMake(130,100,0,0))
        stepper.sizeToFit()
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        stepper.addTarget(self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(stepper)
        */
        
        /*---------------------------------------
        let textField = UITextField(frame: CGRectMake(60,80,200,30))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.placeholder = "Your Mail"
        textField.autocorrectionType = UITextAutocorrectionType.Yes
        textField.returnKeyType = UIReturnKeyType.Done
        textField.clearButtonMode = UITextFieldViewMode.WhileEditing
        textField.keyboardType = UIKeyboardType.EmailAddress
        textField.keyboardAppearance = UIKeyboardAppearance.Dark
        textField.delegate = self
        
        self.view.addSubview(textField)
        */
        /*---------------------------------------
        let datePicker = UIDatePicker()
        datePicker.center = CGPointMake(160, 200)
        datePicker.tag = 1
        self.view.addSubview(datePicker)
        
        let bt = UIButton(type: UIButtonType.RoundedRect)
        bt.frame = CGRectMake(20, 360, 280, 44)
        bt.backgroundColor = UIColor.lightGrayColor()
        bt.setTitle("Get date", forState: UIControlState.Normal)
        bt.addTarget(self, action: "getDate", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bt)
        */
        /*---------------------------------------
        indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        indicator.center = CGPointMake(160, 200)
        indicator.startAnimating()
        indicator.tag = 1
        self.view.addSubview(indicator)
        
        let bt = UIButton(type: UIButtonType.RoundedRect)
        bt.frame = CGRectMake(20, 360, 280, 44)
        bt.backgroundColor = UIColor.darkGrayColor()
        bt.setTitle("Stop", forState: UIControlState.Normal)
        bt.addTarget(self, action: "stopAnimation", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bt)
        */
        
        let webView = UIWebView(frame: CGRectMake(1,20,320,460))
        let request = NSURLRequest(URL:NSURL(string: "http://www.qq.com")!)
        webView.loadRequest(request)
        let html = "<font color='blue'>Hello</font>, <B>Sexy</B> and <i>Seift</>"
        webView.loadHTMLString(html, baseURL: nil)
        self.view.addSubview(webView)
    }
    /*
    var indicator:UIActivityIndicatorView!
    func stopAnimation(){
        //let indicator = self.view.viewWithTag(1) as! UIActivityIndicatorView
        indicator.stopAnimating()
    }
    
    func getDate(){
        let dp = self.view.viewWithTag(1) as! UIDatePicker
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        let dateAndTime = dateFormater.stringFromDate(dp.date)
        
        let alert = UIAlertController(title: "Information", message: dateAndTime, preferredStyle: UIAlertControllerStyle.Alert)
        let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(actionOK)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(tF: UITextField) -> Bool{
        tF.resignFirstResponder()
        return true
    }
    
    func valueChanged(s:UIStepper){
        let value = s.value
        let label = self.view.viewWithTag(1) as! UILabel
        label.text = "\(value)"
    }
    
    func switchChanged(uiSwitch:UISwitch){
        var message = "Turn on the switch"
        if(!uiSwitch.on)
        {
            message = "Turn off the switch"
        }
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let actionYes = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: {(alerts: UIAlertAction!) -> Void in print("TURN ON")})
        let actionNo = UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: {(alerts: UIAlertAction!) -> Void in print("TURN OFF")})
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func buttonTap(button:UIButton){
        let alert = UIAlertController(title: "Information", message: "What's your favorite pastime?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let reading = UIAlertAction(title: "reading", style: UIAlertActionStyle.Default, handler: {(alerts: UIAlertAction!) -> Void in print("I link reading")})
        alert.addAction(reading)
        let fishing = UIAlertAction(title: "fishing", style: UIAlertActionStyle.Default, handler: {(alerts: UIAlertAction!) -> Void in print("I link fishing")})
        alert.addAction(fishing)
        let nothing = UIAlertAction(title: "nothing", style: UIAlertActionStyle.Default, handler: {(alerts: UIAlertAction!) -> Void in print("A life of nonsense")})
        alert.addAction(nothing)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

