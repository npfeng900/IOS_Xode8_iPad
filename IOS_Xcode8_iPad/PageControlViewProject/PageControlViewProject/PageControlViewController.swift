//
//  PageControlViewController.swift
//  PageControlViewProject
//
//  Created by Niu Panfeng on 6/28/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController, UIScrollViewDelegate {

    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var isPageControlUsed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var screenFrame = UIScreen.mainScreen().bounds
        let screenWitdh = screenFrame.size.width
        let screenHeight = screenFrame.size.height
        scrollView.frame = screenFrame
        scrollView.pagingEnabled = true
        scrollView.contentSize = CGSizeMake(screenWitdh*2, screenHeight)
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.delegate = self
        
        let pcHeight:CGFloat = 50.0
        let pcRect = CGRectMake(0, screenHeight-pcHeight, screenWitdh, pcHeight)
        pageControl.frame = pcRect
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.backgroundColor = UIColor.grayColor()
        pageControl.addTarget(self, action: "pageControlDidChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        let firstController = FirstSubViewController()
        screenFrame.origin.x = 0
        firstController.view.frame = screenFrame
        
        let secondController = SecondSubViewController()
        screenFrame.origin.x = screenFrame.size.width
        secondController.view.frame = screenFrame
        
        scrollView.addSubview(firstController.view)
        scrollView.addSubview(secondController.view)
        
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
    }
    
    func pageControlDidChanged(sender:AnyObject){
        let crtPage = (CGFloat)(pageControl.currentPage)
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * crtPage
        frame.origin.y = 0
        
        print(frame.origin.x)
        
        scrollView.scrollRectToVisible(frame, animated: true)
        isPageControlUsed = true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(!isPageControlUsed)
        {
            let pageWidth = scrollView.frame.size.width
            let page = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
            pageControl.currentPage = Int(page)
            
            print(scrollView.contentOffset.x)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        isPageControlUsed = false
        print("scrollViewDidEndDecelerating")
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
