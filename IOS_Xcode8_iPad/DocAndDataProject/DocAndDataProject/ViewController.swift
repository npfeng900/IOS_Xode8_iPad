//
//  ViewController.swift
//  DocAndDataProject
//
//  Created by Niu Panfeng on 7/10/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //====常用目录===================================================================
        /*
        let homePath = NSHomeDirectory()
        print("homePath:\(homePath)")

        let documentPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentPath2 = NSHomeDirectory() + "/Documents"
        print("documentPath1:\(documentPaths[0])")
        print("documentPath2:\(documentPath2)")
        
        let libraryPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.LibraryDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let libraryPath2 = NSHomeDirectory() + "/Library"
        print("libraryPath1:\(libraryPaths[0])")
        print("libraryPath2:\(libraryPath2)")
        
        let cachePaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let cachePath2 = NSHomeDirectory() + "/Library/Caches"
        print("cachePath1:\(cachePaths[0])")
        print("cachePath2:\(cachePath2)")
        
        let tmpPath1 = NSTemporaryDirectory()
        let tmpPath2 = NSHomeDirectory() + "/tmp"
        print("tmpPath1:\(tmpPath1)")
        print("tmpPath2:\(tmpPath2)")
        */
        //=====文件夹创建==================================================================
        /*
        let manager = NSFileManager.defaultManager()
        let baseURL = NSHomeDirectory() + "/Documents/txtFolder"
        let exist = manager.fileExistsAtPath(baseURL)
        if !exist
        {
            do{
                try manager.createDirectoryAtPath(baseURL, withIntermediateDirectories: true, attributes: nil)
                print("Success to create folder.")
                
            }
            catch{
                print("Error to create folder.")
            }
        }
        else
        {
            print("Already exitst this folder.")
        }
        */
        //====写入各种类型文件===================================================================
        /*
        self.write()
        self.writeArray()
        self.writeDictionary()
        self.writeImage()
        */
        //====对文件进行遍历===================================================================
        /*
        let manager = NSFileManager.defaultManager()
        let url = NSHomeDirectory() + "/Documents/"
        do{
            let contents = try manager.contentsOfDirectoryAtPath(url)
            print("contents:\(contents)")
            
            let contents2 = manager.enumeratorAtPath(url)
            print("contents2:\(contents2?.allObjects)")
        }
        catch{
            print("Error occurs.")
        }
        */
        //====对文件复制、删除、移动操作===================================================================
        /*
        self.listFolder()
        //self.copyFile("sexy.txt",targetFileName: "sexy_2.txt")
        //self.listFolder()
        //self.createFolder("backUp")
        //self.listFolder()
        self.moveFile("mm.jpg",targetFolderName: "backUp")
        self.listFolder()
        //self.removeFile("sexy_2.txt")
        //self.listFolder()
        //self.removeFolder("backUp")
        //self.listFolder()
        //print(NSHomeDirectory())
        */
        //====应用程序退出事件===================================================================
        /*
        let app = UIApplication.sharedApplication()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "doSomething:", name: UIApplicationWillResignActiveNotification, object: app)
        */
        //====应用程序是否首次启动===============================================================
        /*
        let EVERLAUNCHED = "everLanuched"
        let FIRSTLAUNCH = "firstLanuch"
        if(!NSUserDefaults.standardUserDefaults().boolForKey(EVERLAUNCHED))
        {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: EVERLAUNCHED)
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: FIRSTLAUNCH)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        else
        {
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: FIRSTLAUNCH)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        let message = NSUserDefaults.standardUserDefaults().boolForKey(FIRSTLAUNCH) ? "It's the first show" : "It's not the first show"
        print(message)
        */
        //====属性文件===============================================================
        /*
        let plistPath = NSBundle.mainBundle().pathForResource("demoPlist", ofType: "plist")
        
        let data:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let message = data.description
        print(message)
        
        data.setObject("Laine", forKey: "Name")
        data.setObject("30", forKey: "Age")
        data.writeToFile(plistPath!, atomically: true)
        
        let data2:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: plistPath!)!
        let message2 = data2.description
        print(message2)
        */
        //=========================================================================
        let user1 = UserModel()
        user1.name = "Freya"
        user1.password = "1234556"
       
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(user1, forKey: "user1Key")
        archiver.finishEncoding()
        let filePath = NSHomeDirectory() + "/Documents/contacts.data"
        data.writeToFile(filePath, atomically: true)
        
        let fileData = NSMutableData(contentsOfFile: filePath)
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: fileData!)
        let savedUser = unarchiver.decodeObjectForKey("user1Key")
        unarchiver.finishDecoding()
        
        print(savedUser?.name)
        print(savedUser?.password)
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////
    func doSomething(sender:AnyObject){
        print("Saving data before exit.")
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////
    func copyFile(sourceFileName:String, targetFileName:String){
        let fileManager = NSFileManager.defaultManager()
        let sourceUrl = NSHomeDirectory() + "/Documents/"+sourceFileName
        let targetUrl = NSHomeDirectory() + "/Documents/"+targetFileName
        do{
            try fileManager.copyItemAtPath(sourceUrl, toPath: targetUrl)
            print("Success to copy file.")
        }
        catch{
            print("Failed to copy file." )
        }
    }
    func moveFile(sourceFileName:String,targetFolderName:String){
        let fileManager = NSFileManager.defaultManager()
        let sourceUrl = NSHomeDirectory() + "/Documents/"+sourceFileName
        let targetUrl = NSHomeDirectory() + "/Documents/"+targetFolderName + "/"
        do{
            try fileManager.moveItemAtPath(sourceUrl, toPath: targetUrl)
            print("Success to move file.")
        }
        catch let error as NSError{
            print("Failed to move file.\(error)") // 有bug
        }
    }
    func removeFile(fileName:String){
        let fileManager = NSFileManager.defaultManager()
        let sourceUrl = NSHomeDirectory() + "/Documents/"+fileName
        do{
            try fileManager.removeItemAtPath(sourceUrl)
            print("Success to remove file.")
        }
        catch{
            print("Failed to remove file.")
        }
    }
    func removeFolder(folderName:String){
        let fileManager = NSFileManager.defaultManager()
        let folder = NSHomeDirectory() + "/Documents/"+folderName
        let files:[AnyObject]? = fileManager.subpathsAtPath(folder)
        for file in files!
        {
            do{
                try fileManager.removeItemAtPath(folder+"/\(file)")
            }
            catch{
                print("Failed to remove folder")
            }
        }
        do{
            try fileManager.removeItemAtPath(folder)
            print("Success to remove folder")
        }
        catch{
            print("Failed to remove folder")
        }
        
    }
    func createFolder(folderName:String){
        let fileManager = NSFileManager.defaultManager()
        let url = NSHomeDirectory() + "/Documents/"+folderName
        if !fileManager.fileExistsAtPath(url)
        {
            do{
                try fileManager.createDirectoryAtPath(url, withIntermediateDirectories: true, attributes: nil)
                print("Success to create folder.")
                
            }
            catch{
                print("Error to create folder.")
            }
        }
        else
        {
            print("Already exitst this folder.")
        }

        
    }
    func listFolder(){
        let fileManager = NSFileManager.defaultManager()
        let url = NSHomeDirectory() + "/Documents/"
        let contents = fileManager.enumeratorAtPath(url)
        print("contents:\(contents?.allObjects)")

    }
    /////////////////////////////////////////////////////////////////////////////////////////////////
    func write(){
        let info = "I like sexy girls, I love sexy girs so so .... much.\n"
        let filePath:String = NSHomeDirectory() + "/Documents/sexy.txt"
        do{
            try info.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
            print("Success to write a file.")
        }
        catch{
            print("Error to write a file.")
        }
    }
    func writeArray(){
        let fruits = NSArray(objects: "Apple","Banana","Oragne")
        let fruitsPath:String = NSHomeDirectory() + "/Documents/fruitsPath.plist"
        if fruits.writeToFile(fruitsPath, atomically: true)
        {
            print("Success to write an array." )
        }
    }
    func writeDictionary(){
        let objects = ["Xcode", "Swift"]
        let keys = ["Software", "Language"]
        let products = NSDictionary(objects: objects, forKeys: keys)
        let productsPath:String = NSHomeDirectory() + "/Documents/product.plist"
        if products.writeToFile(productsPath, atomically: true)
        {
            print("Success to write a dictionary." )
        }
    }
    func writeImage(){
        let image = UIImage(named: "mm")
        let imageData:NSData = UIImageJPEGRepresentation(image!, 1)!
        let imagePath:String = NSHomeDirectory() + "/Documents/mm.jpg"
        if imageData.writeToFile(imagePath, atomically: true)
        {
            print("Success to write an image." )
        }
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

