//
//  SingletonClass.swift
//  SingletonProject
//
//  Created by Niu Panfeng on 7/23/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import Foundation

class Singleton
{
    var action = "Run"
    class var shareInstance: Singleton
    {
        get
        {
            struct Static
            {
                static var onceToken : dispatch_once_t = 0
                static var instance : Singleton? //不复制的话，默认为nil
            }
            dispatch_once(&Static.onceToken) //只执行一次ß
            {
                Static.instance = Singleton()
            }
            return Static.instance!
        }
    }
    
    func doSth()
    {
        print(action)
    }
}

class Student
{
    var name = "Freya"
    func showName(){
        print(name)
    }
}