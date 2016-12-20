//
//  ViewController.swift
//  PRO2
//
//  Created by Niu Panfeng on 8/2/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var imageView:UIImageView!
    var imagePickerController:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView = UIImageView(frame: CGRectMake(20, 120, 280, 200))
        self.view.addSubview(imageView)
        
        let button = UIButton(frame: CGRectMake(20, 60, 280, 40))
        button.setTitle("Choose an image", forState: UIControlState.Normal)
        button.addTarget(self, action: "pickImage", forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(button)
    }

    func pickImage(){
       
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            self.imagePickerController = UIImagePickerController()
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = false
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
        else
        {
            print("PhotoLibrary")
            self.imagePickerController = UIImagePickerController()
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = false
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePickerController.navigationBar.barTintColor = UIColor.orangeColor()
            self.imagePickerController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.redColor()]
            self.imagePickerController.navigationBar.tintColor = UIColor.greenColor()
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

