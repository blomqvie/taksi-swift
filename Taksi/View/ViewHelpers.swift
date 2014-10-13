//
//  OrderButton.swift
//  Taksi
//
//  Created by Eetu Blomqvist on 08/10/14.
//  Copyright (c) 2014 Reaktor. All rights reserved.
//

import Foundation
import MapKit

class ViewHelpers {
    class func createOrderButton() -> UIButton {
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.setTitle("Tilaa taksi", forState: UIControlState.Normal)
        return button
    }
    
    class func createMapView() -> MKMapView {
        let map = MKMapView()
        map.scrollEnabled = false
        map.rotateEnabled = false
        map.zoomEnabled = false
        return map
    }
}
