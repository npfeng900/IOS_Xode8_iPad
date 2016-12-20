//
//  ViewController.swift
//  SingletonProject
//
//  Created by Niu Panfeng on 7/23/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let singleton = Singleton.shareInstance
        let singleton2 = Singleton.shareInstance
        singleton.doSth()
        singleton2.action = "Walk"
        singleton.doSth()
        singleton2.doSth()
        
        let studentA = Student()
        let studentB = studentA //赋值时乃值引用操作，不同的实例，相同的内容地址
        studentA.showName()
        studentB.name = "Oliva"
        studentA.showName()
        studentB.showName()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

