//
//  TrackerView.swift
//  Taksi
//
//  Created by Eetu Blomqvist on 03/10/14.
//  Copyright (c) 2014 Reaktor. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Snappy

class TrackerView: UIView {

    let mapView = MKMapView()
    let infoView = UIView()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    func configure() {
        self.addSubview(mapView)
        self.addSubview(infoView)

        let padding = UIEdgeInsetsMake(10, 10, 10, 10)
        mapView.snp_makeConstraints { make in
            make.top.left.right.equalTo(self).with.insets(padding)
            make.height.lessThanOrEqualTo(self.frame.height / 2)
            return
        }

        infoView.backgroundColor = UIColor.greenColor()
        infoView.snp_makeConstraints { make in
            make.top.equalTo(self.mapView.snp_bottom).with.insets(padding)
            make.right.left.bottom.equalTo(self).with.insets(padding)
            return
        }
    }
}
