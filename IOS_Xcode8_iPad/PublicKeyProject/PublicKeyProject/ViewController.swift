//
//  ViewController.swift
//  PublicKeyProject
//
//  Created by Niu Panfeng on 7/31/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //遍历字体
        /*
        for familyName in UIFont.familyNames()
        {
            print("\n[\(familyName)]")
            for font in UIFont.fontNamesForFamilyName(familyName)
            {
                print("\t\(font)")
            }
        }
        */
        
        //宏注释
        //self.addImage()
        
        //日期差
        /*
        let dateA = NSDate()
        let dateB = NSDate(timeInterval: -60*60*24*1000, sinceDate: NSDate())
       
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let components = calendar?.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: dateA, toDate: dateB, options: NSCalendarOptions.MatchFirst)
        
        print("Day:\(components?.day)")
        print("Mon:\(components?.month)")
        print("Year:\(components?.year)")
        */
        
        //正则表达式
        /*
        let pattern = "^([a-z0-9_\\.-]+)@([a-z\\d\\.-]+)\\.([a-z\\.]{2,6})$"
        let matcher = RegexHelper(pattern)
        let result = "tapinfinity@gmail.com"
        if matcher.match(result)
        {
            print("It's an email")
        }
        else
        {
            print("It's not an email")
        }
        */
        
        //OC桥接文件
        let sumNumber = SumNumbers()
        let result = sumNumber.sum(1, andNumber2: 45)
        print("result:\(result)")
    }
    
    //MARK: -
    //MARK: AddImage
    func addImage(){
        let image = UIImage(named: "sexy")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 320, 480)
        self.view.addSubview(imageView)
    }
    //MARK: -
    //MARK: didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
//MARK: -
//MARK: Regex
struct RegexHelper {
    let regex: NSRegularExpression?
    init(_ pattern: String){
        do{
            regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
        }
        catch{
            regex = nil
        }
    }
    func match(input: String) -> Bool{
        if let matches = regex?.matchesInString(input, options: NSMatchingOptions.ReportProgress, range: NSMakeRange(0, input.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)))
        {
            return matches.count > 0
        }
        else
        {
            return false
        }
    }
}
