//
//  ViewController.swift
//  MKMapViewProject
//
//  Created by Niu Panfeng on 7/7/16.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let map = MKMapView(frame: self.view.bounds)
        map.showsUserLocation = true
        map.mapType = MKMapType.Satellite
        
        let coordinate2D = CLLocationCoordinate2D(latitude: 39.915352, longitude: 116.397105)
        let zoomLevel = 0.02
        let region = MKCoordinateRegionMake(coordinate2D, MKCoordinateSpanMake(zoomLevel, zoomLevel))
        map.setRegion(map.regionThatFits(region), animated: true)
        
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = coordinate2D
        objectAnnotation.title = "紫禁城"
        objectAnnotation.subtitle = "China's biggest palace"
        map.addAnnotation(objectAnnotation)
        
        self.view.addSubview(map)


        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: 39.915352, longitude: 116.397105)
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placeMarks:[CLPlacemark]?,error:NSError?) -> Void in
            if placeMarks?.count > 0
            {
                let placeMark = placeMarks?.first
                print(placeMark?.name)
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

