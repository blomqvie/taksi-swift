//
//  HubView.swift
//  Taksi
//
//  Created by Eetu Blomqvist on 08/10/14.
//  Copyright (c) 2014 Reaktor. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class HubView : UIView {
    
    let hubinfo = UILabel()
    let additionalInfo = UITextField()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configure() {
        self.addSubview(hubinfo)
        self.addSubview(additionalInfo)
        self.backgroundColor = UIColor.lightGrayColor()
        self.layer.cornerRadius = 8.0
                
        hubinfo.text = "Taksikeskuksen tiedot:"
        hubinfo.numberOfLines = 0
        hubinfo.sizeToFit()
        additionalInfo.placeholder = "Syötä lisätiedot"
        
        hubinfo.snp_makeConstraints { make in
            make.left.right.top.equalTo(self).with.insets(UIEdgeInsetsMake(10, 10, 10, 0))
            return
        }
        
        additionalInfo.borderStyle = UITextBorderStyle.RoundedRect
        additionalInfo.snp_makeConstraints { make in
            let insets = UIEdgeInsetsMake(0, 10, 10, 10)
            make.left.right.bottom.equalTo(self).with.insets(insets)
        }
    }
}