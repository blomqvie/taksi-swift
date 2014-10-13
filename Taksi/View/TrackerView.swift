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

    let mapView = ViewHelpers.createMapView()
    let addressView = UILabel()
    let infoView = HubView(frame: CGRectZero)
    let orderButton = ViewHelpers.createOrderButton()

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
        self.addSubview(addressView)
        self.addSubview(infoView)
        self.addSubview(orderButton)

        let padding = UIEdgeInsetsMake(10, 10, 10, 10)
        
        mapView.snp_makeConstraints { make in
            make.top.left.right.equalTo(self).with.insets(padding)
            make.height.equalTo(self.snp_height).multipliedBy(0.5)
         }

        addressView.text = "Osoitetta haetaan..."
        addressView.snp_makeConstraints { make in
            make.top.equalTo(self.mapView.snp_bottom)
            make.left.equalTo(self.snp_left).with.insets(UIEdgeInsetsMake(padding.top, padding.left + 10, padding.bottom, padding.right + 10))
            make.right.equalTo(self.snp_right).with.insets(padding)
            make.height.equalTo(self.snp_height).multipliedBy(0.1)
        }
        
        infoView.snp_makeConstraints { make in
            make.top.equalTo(self.addressView.snp_bottom)
            make.left.equalTo(self.snp_left).with.insets(padding)
            make.right.equalTo(self.snp_right).with.insets(padding)
            
        }
        
        orderButton.snp_makeConstraints { make in
            make.top.equalTo(self.infoView.snp_bottom)
            make.height.equalTo(50)
            make.right.left.equalTo(self).with.insets(padding)
            make.bottom.equalTo(self.snp_bottom)
        }
    }
}
