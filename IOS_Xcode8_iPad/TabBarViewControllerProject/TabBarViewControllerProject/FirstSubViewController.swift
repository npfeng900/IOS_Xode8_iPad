//
//  FirstSubViewController.swift
//  TabBarViewControllerProject
//
//  Created by Niu Panfeng on 6/29/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class FirstSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Item #1"
        self.tabBarItem.image = UIImage(named: "3")
        self.view.backgroundColor = UIColor.brownColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
