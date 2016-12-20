//
//  ViewController.swift
//  PRO3
//
//  Created by Niu Panfeng on 8/2/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import CoreText

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let string = NSMutableAttributedString(string: "Interactive tutorials for Xcode")
        
        let font = CTFontCreateWithName("ArialMT", 32, nil)
        string.addAttribute(kCTFontAttributeName as String, value: font, range: NSRange(location: 0, length: 11))
       
        string.addAttribute(NSForegroundColorAttributeName as String, value: UIColor.redColor(), range: NSRange(location: 0, length: 11))
        
        var number = 6
        let cfNumber = CFNumberCreate(kCFAllocatorDefault, CFNumberType.SInt8Type, &number)
        string.addAttribute(kCTStrokeWidthAttributeName as String, value: cfNumber, range: NSMakeRange(12, 9))
        
        let italicFont = UIFont.italicSystemFontOfSize(14)
        let fontValue = CTFontCreateWithName(italicFont.fontName, 14, nil)
        string.addAttribute(kCTFontAttributeName as String, value: fontValue, range: NSRange(location: 22, length: 3))
        
        string.addAttribute(kCTUnderlineStyleAttributeName as String, value: NSNumber(double: 1), range: NSRange(location: 26, length: 5))
        
        let label = UILabel(frame: CGRectMake(10,60,300,40))
        label.attributedText = string
        self.view.addSubview(label)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

