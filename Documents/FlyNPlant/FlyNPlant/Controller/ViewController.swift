//
//  ViewController.swift
//  FlyNPlant
//
//  Created by rbollen on 07/03/2020.
//  Copyright © 2020 7RedBits. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SwiftyJSON

class ViewController: UIViewController {
    
    var airportsFile = "airportstest"
    var airportArray = [Airport]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // test to calculate the distance between coordinates in longitude and latitude
//        let locA = CLLocation(latitude: lat1, longitude: long1)
//
//        let locB = CLLocation(latitude: lat2, longitude: long2)
//
//        let distance = locA.distance(from: locB)
        loadInitialData()
    }
    
    func loadInitialData() {
        
        // define a data variable to store the raw JSON data in
        var data: Data?
        
        // get the data from the local filesystem JSON file
        if let path = Bundle.main.path(forResource: airportsFile, ofType: "json") {
            do {
                  data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
              } catch {
                   // handle error
              }
        }
        
        // Extract each airport details and add it to the airportArray
        if let safeData = data {
           
            let airportJSON = try? JSON(data: safeData).array
            guard let safeJSON = airportJSON else { return }
            for item in safeJSON {
                let continent = item["continent"].stringValue
                
                let coordinates = item["coordinates"].stringValue
                // "-68.50029754638672, 46.778900146484375"
                // trim space from the coordinates string
                let trimmed = coordinates.replacingOccurrences(of: " ", with: "")
                // split it where the comma is into an array of 2 values
                print("trimmed: \(trimmed)")
                let coordinatesStringArray = trimmed.components(separatedBy: ",")
                // store them in the
                let longitude =  coordinatesStringArray[0]
                let latitude = coordinatesStringArray[1]
                
                let elevation_ft = item["elevation_ft"].stringValue
                let gps_code = item["gps_code"].stringValue
                let iata_code = item["iata_code"].stringValue
                let ident = item["ident"].stringValue
                let iso_country = item["iso_country"].stringValue
                let iso_region = item["iso_region"].stringValue
                let local_code = item["local_code"].stringValue
                let municipality = item["municipality"].stringValue
                let name = item["name"].stringValue
                let type = item["type"].stringValue
                let importedAirport = Airport(continent: continent, coordinates: coordinates, latitude: latitude, longitude: longitude, elevation_ft: elevation_ft, gps_code: gps_code, iata_code: iata_code, ident: ident, iso_country: iso_country, iso_region: iso_region, local_code: local_code, municipality: municipality, name: name, type: type)
                airportArray.append(importedAirport)
            }
            
            dump(airportArray)
        }
            
            
//        loadInitialData()
//        mapView.addAnnotations(pois)
//        mapView.showsPointsOfInterest = true // show official Apple POIs, is true by default
        
    }
    
//    func parseJSON(airportData: Data) {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(Airport.self, from: airportData) // add .self to reference the type
//            print(decodedData.coordinates)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }


}

