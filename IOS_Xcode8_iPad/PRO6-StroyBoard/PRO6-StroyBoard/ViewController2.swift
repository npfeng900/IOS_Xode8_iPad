//
//  ViewController2.swift
//  PRO6-StroyBoard
//
//  Created by Niu Panfeng on 8/6/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBAction func nextPage(sender: AnyObject) {
        self.performSegueWithIdentifier("segueToPage3", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueToPage3"
        {
            let vc = segue.destinationViewController as! ViewController3
            vc.name = "Freya Love her mom"
        }
    }
    

}
