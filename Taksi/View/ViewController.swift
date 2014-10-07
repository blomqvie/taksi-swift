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
    
    var addressResolver: AddressResolver!
    var taxiService: TaxiService!
    var lastMunicipality = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressResolver = AddressResolver()
        taxiService = TaxiService()
        
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
        println(userLocation.location)
        addressResolver.resolveAddress(userLocation.location, {(address: Address?) in
            if (address != nil) && address!.municipality != self.lastMunicipality  {
                self.taxiService.fetchTaxiData(address!.zipcode, municipality: address!.municipality, { (op: Operator?) in
                    self.lastMunicipality = address!.municipality
                    // TODO show operator info
                    return
                })
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

