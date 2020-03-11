//
//  LocationDelegate.swift
//  AlQiblaDirection
//
//  Created by Faisal Babkoor on 3/11/20.
//  Copyright © 2020 Faisal Babkoor. All rights reserved.
//

import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    var locationCallback: ((CLLocation) -> ())? = nil
    var headingCallback: ((CLLocationDirection) -> ())? = nil
    var errorCallback: ((String) -> ())? = nil

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        locationCallback?(currentLocation)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        headingCallback?(newHeading.trueHeading)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        errorCallback?("⚠️ Please enable Location!")
    }
}
