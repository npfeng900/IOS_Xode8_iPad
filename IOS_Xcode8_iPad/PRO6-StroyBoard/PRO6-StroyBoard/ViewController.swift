//
//  ViewController.swift
//  PRO6-StroyBoard
//
//  Created by Niu Panfeng on 8/6/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goPage1ofStroyboard(sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "ServiceStoryBoard", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController()
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func goPage2ofStroyboard(sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "ServiceStoryBoard", bundle: nil)
        let vc = storyBoard.instantiateViewControllerWithIdentifier("servicePage")
        self.navigationController?.pushViewController(vc, animated: true)
        //self.tabBarController?.tabBar.hidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

