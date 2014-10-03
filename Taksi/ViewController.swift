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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var trackerView = TrackerView(frame: self.view.frame)
        self.view.addSubview(trackerView)

        trackerView.snp_makeConstraints { make in
            make.edges.equalTo(self.view)
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

