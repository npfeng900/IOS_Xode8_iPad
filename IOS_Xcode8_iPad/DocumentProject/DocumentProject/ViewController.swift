//
//  ViewController.swift
//  DocumentProject
//
//  Created by Niu Panfeng on 7/23/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NSXMLParserDelegate {
    
    private var workers:NSMutableArray! = NSMutableArray()
    private var currentTag:NSString!
    private var currentWork:Worker! //一个实体

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        var xmlPath:NSString! = NSString()
        xmlPath = NSBundle.mainBundle().pathForResource("worker", ofType: "xml")
        do{
            let xmlContent:NSString! = try NSString(contentsOfFile: xmlPath as String, encoding:1)
            print("\(xmlContent)")
            
            let myParse = NSXMLParser(data: xmlContent.dataUsingEncoding(NSUTF8StringEncoding)!)
            myParse.delegate = self
            
            if !myParse.parse()
            {
                print("\(myParse.parserError)")
            }
        }
        catch{
            print("Error!")
        }*/
        
        let path = NSBundle.mainBundle().pathForResource("menu", ofType: "json")
        if let jsonData = NSData(contentsOfFile: path!)
        {
            do{
                if let jsonObj:NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions()) as? NSDictionary
                {                    if let menuDic:NSDictionary = jsonObj["menu"] as? NSDictionary
                    {
                        if let menuItems:NSArray = menuDic["menuItem"] as? NSArray
                        {
                            for item in menuItems{
                                print("item: \(item)")
                            }
                        }
                    }
                }
            }
            catch{
                print("@@Error!")
            }
        }
    }
    
    func parserDidStartDocument(parser: NSXMLParser) {
        print("---------Begin")
    }
    func parserDidEndDocument(parser: NSXMLParser) {
        print("---------End")
        for var i = 0; i<workers.count; i++
        {
            let work = workers[i] as! Worker
            
            print(work.id)
            print(work.name)
            print(work.age)
            print(work.salary)
            
        }
    }
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
    
        currentTag = elementName
        if currentTag == "worker"
        {
            currentWork    = Worker()
            currentWork.id = attributeDict["id"]!
        }
    }
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        let str:String! = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if currentTag == "name" && str != ""
        {
            currentWork.name   = string
        }
        else if currentTag == "age" && str != ""
        {
            currentWork.age    = string
        }
        else if currentTag == "salary" && str != ""
        {
            currentWork.salary = string
        }
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "salary"
        {
            workers.addObject(currentWork)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

