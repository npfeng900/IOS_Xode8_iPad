//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Niu Panfeng on 7/17/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageObjectContext = appDelegate.managedObjectContext
        
        /*
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: manageObjectContext) as! User
  
        newUser.userName = "Freya"
        newUser.password = "ffaadd"
        
        do{
            try manageObjectContext.save()
             print("Success to save data!")
        }
        catch{
            print("Failed to save data!")
        }*/
        
        let entity:NSEntityDescription? = NSEntityDescription.entityForName("User", inManagedObjectContext: manageObjectContext)
        
        let request:NSFetchRequest = NSFetchRequest()
        request.fetchOffset = 0
        request.fetchLimit = 10
        request.entity = entity
        //request.predicate = NSPredicate(format: " userName = 'Freya' ","")
        
        do{
            
            let result0:[AnyObject]? = try manageObjectContext.executeFetchRequest(request)
            for user:User in result0 as! [User]
            {
                user.userName = "NIUNIUNIU"
                manageObjectContext.deleteObject(user)
            }
            try manageObjectContext.save()
            
            let result:[AnyObject]? = try manageObjectContext.executeFetchRequest(request)
            for user:User in result as! [User]
            {
                print("userName=\(user.userName)")
                print("password=\(user.password)")
            }
        }
        catch{
            print("Failed to fetch data!")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

