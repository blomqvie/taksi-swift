//
//  TaxiService.swift
//  Taksi
//
//  Created by Eetu Blomqvist on 05/10/14.
//  Copyright (c) 2014 Reaktor. All rights reserved.
//

import Foundation
import Alamofire

class TaxiService {
    
    func fetchTaxiData(zipcode: String, municipality: String, cb: (Operator?) -> Void) {
        Alamofire.request(.GET, "http://taksi-api.herokuapp.com/api/taxi", parameters: ["municipality": municipality, "zipcode": zipcode])
            .responseString { (_, _, JSON, _) in
                    println(JSON)
                    cb(nil)
        }
    }
}

struct Operator {
    let name: String
    let municipalities: [String]
    let phone: String
    let sms: SMSInfo?
    
    // TODO implement init which parses given JSON string
}

struct SMSInfo {
    let number: String
    let template: String
    let instructionsMaxLength: Int
}