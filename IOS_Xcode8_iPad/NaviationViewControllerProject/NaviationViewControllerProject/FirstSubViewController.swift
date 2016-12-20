//
//  FirstSubViewController.swift
//  NaviationViewControllerProject
//
//  Created by Niu Panfeng on 6/29/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class FirstSubViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "First Page"
        self.view.backgroundColor = UIColor.brownColor()
        
        let leftBar = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "Refresh")
        self.navigationItem.leftBarButtonItem = leftBar
        
        let rightBar = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "Save")
        self.navigationItem.rightBarButtonItem = rightBar
        
        let label = UILabel(frame: CGRectMake( 0, 0, 180, 30))
        label.text = "Happy Day"
        label.textAlignment = NSTextAlignment.Center
        
        self.navigationItem.titleView = label
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: "nextPage")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextPage(){
        let viewController2 = SecondSubViewController()
        self.navigationController?.pushViewController(viewController2, animated: true)
    }
    
    func Refresh(){
        let alert = UIAlertController(title: "Information", message: "Refresh my feeling.", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func Save()
    {
        print("Saving...")
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.navigationController?.setToolbarHidden(false, animated: false)
        self.navigationItem.prompt = "Loading..."
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackOpaque
        self.navigationController?.navigationBar.tintColor = UIColor.orangeColor()
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
