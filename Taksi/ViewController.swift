//
//  ViewController.swift
//  Taksi
//
//  Created by Eetu Blomqvist on 03/10/14.
//  Copyright (c) 2014 Reaktor. All rights reserved.
//

import UIKit
import MapKit
import Snappy
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var trackerView = TrackerView(frame: self.view.frame)
        self.view.addSubview(trackerView)
        
        trackerView.snp_makeConstraints { make in
            make.edges.equalTo(self.view)
            return
        }
        
        trackerView.mapView.delegate = self
        trackerView.mapView.userTrackingMode = MKUserTrackingMode.Follow
    }

    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        println(userLocation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

