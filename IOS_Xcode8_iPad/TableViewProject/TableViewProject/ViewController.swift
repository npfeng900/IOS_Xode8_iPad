//
//  ViewController.swift
//  TableViewProject
//
//  Created by Niu Panfeng on 7/7/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tableView = UITableView(frame: CGRectMake(0,30,320,430))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.setEditing(true, animated: false)
        
        let indexPath = NSIndexPath(forRow: month.count - 2, inSection: 0)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        
        self.view.addSubview(tableView)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return month.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "reuseCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
        }
        
        let rowNum = indexPath.row
        cell?.textLabel?.text = month[indexPath.row]
        cell?.detailTextLabel?.text = "Detail Information here."
        let imageOn = UIImage(named: "on")
        let imageOff = UIImage(named: "off")
        cell?.imageView?.image = imageOff
        cell?.imageView?.highlightedImage = imageOn
        
        if(rowNum % 2 == 0)
        {
            cell?.backgroundColor = UIColor.purpleColor()
        }
        else
        {
            let view = UIView(frame: CGRectMake(0,0,1,1))
            view.backgroundColor = UIColor.orangeColor()
            
            cell?.backgroundView = view
        }
        
        return cell!;
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if(cell?.accessoryType == UITableViewCellAccessoryType.None)
        {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else
        {
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
    }
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        //return UITableViewCellEditingStyle.Delete
        //return UITableViewCellEditingStyle.Insert
        return UITableViewCellEditingStyle.None

    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let rowNum = indexPath.row
        
        if(editingStyle == UITableViewCellEditingStyle.Delete)
        {
            
            month.removeAtIndex(rowNum)
            
            let indexPaths = [indexPath]
            tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        else if(editingStyle == UITableViewCellEditingStyle.Insert)
        {
            month.insert("Honey Moon", atIndex: rowNum)
            
            let indexPaths = [indexPath]
            tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Bottom)
        }
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let fromRow = sourceIndexPath.row
        let toRow = destinationIndexPath.row
        let obj = month[fromRow]
        month.insert(obj, atIndex: toRow)
        
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

