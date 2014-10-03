//
//  AddressParser.swift
//  Taksi
//
//  Created by Eetu Blomqvist on 03/10/14.
//  Copyright (c) 2014 Reaktor. All rights reserved.
//

import Foundation
import CoreLocation

class AddressResolver {
    
    let noAddress = Address(fullAddress: "",municipality: "",zipcode: "")
    let geocoder = CLGeocoder()
    
    func resolveAddress(location: CLLocation, callback: (Address) -> Void) {
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            let asObj: AnyObject? = placemarks?.last
            if let mark = asObj as? CLPlacemark {
                callback(Address(fullAddress: self.createFullAddress(mark), municipality: "", zipcode: mark.postalCode))
            }
            else { callback(self.noAddress)}
        })
    }
    
    private func createFullAddress(placemark: CLPlacemark) -> String {
        return "foo"
    }
}
struct Address {
    let fullAddress: String
    let municipality: String
    let zipcode: String
    
    init(fullAddress:String, municipality: String, zipcode: String){
        self.fullAddress = fullAddress
        self.municipality = municipality
        self.zipcode = zipcode
    }
}