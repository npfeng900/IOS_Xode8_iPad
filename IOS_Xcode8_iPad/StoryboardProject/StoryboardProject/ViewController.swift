//
//  ViewController.swift
//  StoryboardProject
//
//  Created by Niu Panfeng on 7/3/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var currentImageNum=1
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBAction func NextImage(sender: AnyObject) {
        currentImageNum += 1
        let picName = "pic\(currentImageNum)"
        imageView.image = UIImage(named: picName)
        label.text = picName
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

