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
    
    let geocoder = CLGeocoder()
    
    func resolveAddress(location: CLLocation, callback: (Address?) -> Void) {
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
            if let mark = placemarks?.last as CLPlacemark? {
                let municipality = self.parseMunicipality(mark)
                let fullAddress = self.createFullAddress(location, placemark: mark, municipality: municipality)
                callback(Address(fullAddress: fullAddress, municipality: municipality, zipcode: mark.postalCode))
            }
            else { callback(nil)}
        })
    }
    
    private func createFullAddress(location: CLLocation, placemark: CLPlacemark, municipality: String) -> String {
        let subThoroughfare = (placemark.subThoroughfare? != nil) ? " \(placemark.subThoroughfare!)" : ""
        return String(format: "\(placemark.thoroughfare!)\(subThoroughfare)\n\(placemark.postalCode) \(municipality) (+/-) %d m", location.horizontalAccuracy)
    }

    private func parseMunicipality(placemark: CLPlacemark) -> String {
        let lines = placemark.addressDictionary["FormattedAddressLines"] as NSArray?
        if lines?.count > 2 {
            let line = lines![lines!.count - 2] as NSString
            if line.length > 6 {
                return line.substringFromIndex(6)
            }
        }
        return placemark.locality
    }
}

struct Address {
    let fullAddress: String
    let municipality: String
    let zipcode: String
}