//
//  ViewController.swift
//  Messner In Class GPS 02
//
//  Created by Brad D. Messner on 3/23/20.
//  Copyright © 2020 Brad D. Messner. All rights reserved.
//
import UIKit
import CoreLocation

                                        
class ViewController: UIViewController, CLLocationManagerDelegate {



    @IBOutlet weak var distanceLabel: UILabel!
    
    
    
    
      let locMan: CLLocationManager = CLLocationManager()
        var startLocation: CLLocation!
        
        // Breckinridge Resort
        let breckLatitude: CLLocationDegrees = 39.4817
        let breckLongitude: CLLocationDegrees = -106.0384
    
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let newLocation: CLLocation=locations[0]
            NSLog("Something is happening")
            
            // horizontal accuracy less than than 0 means failure at gps level
            if newLocation.horizontalAccuracy >= 0 {
                
                
                let breck:CLLocation = CLLocation(latitude: breckLatitude,longitude: breckLongitude)

                let delta:CLLocationDistance = breck.distance(from: newLocation)
                
                let miles: Double = (delta * 0.000621371) + 0.5 // meters to rounded miles
                
                if miles < 3 {
                    // Stop updating the location
                    locMan.stopUpdatingLocation()
                    // Congratulate the user
                    distanceLabel.text = "Enjoy\nBreckinridge Ski Resort!"
                } else {
                    let commaDelimited: NumberFormatter = NumberFormatter()
                    commaDelimited.numberStyle = NumberFormatter.Style.decimal
                    
                    distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Breck"
                }
                
                
            }
            else
            {
                // add action if error with GPS
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            locMan.delegate = self
            locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locMan.distanceFilter = 1609; // a mile (in meters)
            locMan.requestWhenInUseAuthorization() // verify access to gps
            locMan.startUpdatingLocation()
            startLocation = nil
        }


    }





    
    
    
    
    
    
    
    
    
    

 
