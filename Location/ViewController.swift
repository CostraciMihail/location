//
//  ViewController.swift
//  Location
//
//  Created by Winify on 9/7/18.
//  Copyright © 2018 Winify. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        self.locationManager = CLLocationManager()
        locationManager.delegate = self
        self.checkStatus()
    }
    
    func checkStatus() {
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
            
        case .authorizedAlways:
            print("authorizedAlways")
            locationManager.requestWhenInUseAuthorization()
            
        case .authorizedWhenInUse:
            
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
            
        case .denied:
            print("denied")
            locationManager.requestWhenInUseAuthorization()
            
        case .notDetermined:
            print("notDetermined")
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
        case .restricted:
            print("restricted")
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("didUpdateLocations")
        print("coordinate: \(locations)")
    }
}

