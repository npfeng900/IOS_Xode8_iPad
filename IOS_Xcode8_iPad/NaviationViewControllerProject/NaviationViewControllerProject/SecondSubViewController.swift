//
//  SecondSubViewController.swift
//  NaviationViewControllerProject
//
//  Created by Niu Panfeng on 6/29/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

var pageNum = 0

class SecondSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pageNum = pageNum + 1
        
        self.title = "Page\(pageNum)"
        self.view.backgroundColor = UIColor.purpleColor()
        
        let bitPush = UIButton(frame: CGRectMake(40,280,240,30))
        bitPush.setTitle("Push Page", forState: UIControlState.Normal)
        bitPush.backgroundColor = UIColor.greenColor()
        bitPush.addTarget(self, action: "PushPage", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bitPush)
        
        let bitPop = UIButton(frame: CGRectMake(40,320,240,30))
        bitPop.setTitle("Pop Page", forState: UIControlState.Normal)
        bitPop.backgroundColor = UIColor.greenColor()
        bitPop.addTarget(self, action: "PopPage", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bitPop)
        
        let bitIndex = UIButton(frame: CGRectMake(40,360,240,30))
        bitIndex.setTitle("Goto Index Page", forState: UIControlState.Normal)
        bitIndex.backgroundColor = UIColor.greenColor()
        bitIndex.addTarget(self, action: "GotoIndexPage", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bitIndex)
        
        let bitRoot = UIButton(frame: CGRectMake(40,400,240,30))
        bitRoot.setTitle("Goto RootPage", forState: UIControlState.Normal)
        bitRoot.backgroundColor = UIColor.greenColor()
        bitRoot.addTarget(self, action: "GotoRootPage", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bitRoot)
        

        let bitHideNavBar = UIButton(frame: CGRectMake(40,200,240,30))
        bitHideNavBar.setTitle("Hide navigation bar", forState: UIControlState.Normal)
        bitHideNavBar.backgroundColor = UIColor.orangeColor()
        bitHideNavBar.addTarget(self, action: "HideNavigationBar", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bitHideNavBar)
        
        let bitHideBar = UIButton(frame: CGRectMake(40,240,240,30))
        bitHideBar.setTitle("Hide bar", forState: UIControlState.Normal)
        bitHideBar.backgroundColor = UIColor.orangeColor()
        bitHideBar.addTarget(self, action: "HideBar", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(bitHideBar)


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func PushPage(){
        let viewController = SecondSubViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func PopPage(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    func GotoIndexPage(){
        let viewController = self.navigationController?.viewControllers[0]
        self.navigationController?.popToViewController(viewController!, animated: true)
    }
    func GotoRootPage(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    
    
    func HideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func HideBar(){
        self.navigationController?.setToolbarHidden(true, animated: false)
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
