//
//  Flyer.swift
//  FlyNPlant
//
//  Created by rbollen on 07/03/2020.
//  Copyright © 2020 7RedBits. All rights reserved.
//

import Foundation

struct Flyer {
    // airport of origin
    var origin: String
    // airport of destination
    var destination: String
    // CO2 poluted meassured in m3
    var co2: Int
    // how many trees needed to compensate
    var newTreeCount: Int
    // how many trees bought
    var numberOfTreesOrdered: Int
    // how many trees bought in total since initial use of the app
    var totalTreeCount: Int
    /*
     give the client a eco rating
     1 tree = ecoLevel 0
     10 trees = ecoLevel 1
     25 trees = ecoLevel 2
     50 trees = ecoLevel 3
     75 trees = ecoLevel 4
     100 trees = ecoLevel 5
     125 trees = ecoLevel 6
     150 trees = ecoLevel 7
     175 trees = ecoLevel 8
     200+ trees = ecoLevel 9
     */
    var ecoLevel: Int
}
