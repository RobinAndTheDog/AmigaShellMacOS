//
//  Airport.swift
//  FlyNPlant
//
//  Created by rbollen on 15/03/2020.
//  Copyright © 2020 7RedBits. All rights reserved.
//

import Foundation
import CoreLocation

struct Airport {
    var continent: String
    var coordinates: String
    
    // not coming from the json file but the coordinates contains both
    var latitude: String
    var longitude: String
    //
    
    var elevation_ft: String?
    var gps_code: String
    var iata_code: String?
    var ident: String
    var iso_country: String
    var iso_region: String
    var local_code: String
    var municipality: String
    var name: String
    var type: String
}
