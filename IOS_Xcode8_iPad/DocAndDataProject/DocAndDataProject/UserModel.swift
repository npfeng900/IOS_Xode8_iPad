//
//  UserModel.swift
//  DocAndDataProject
//
//  Created by Niu Panfeng on 7/17/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import Foundation

class UserModel: NSObject,NSCoding
{
    var name:NSString!
    var password:NSString!
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.password, forKey: "password")
    }
    required init(coder aDecoder: NSCoder) {
        super.init()
        self.name = aDecoder.decodeObjectForKey("name") as! NSString
        self.password = aDecoder.decodeObjectForKey("password") as! NSString
    }
    override init() {
        
    }
}