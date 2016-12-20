//
//  ViewController3.swift
//  PRO6-StroyBoard
//
//  Created by Niu Panfeng on 8/6/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = name
        // Do any additional setup after loading the view.
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
