//
//  Splash_ViewController.swift
//  OnlineDoctor
//
//  Created by macos on 29/01/23.
//

import UIKit
import CoreLocation
class Splash_ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let locationManager = CLLocationManager()
     let activityIndicator = UIActivityIndicatorView()
    
    @IBOutlet var splashScreenLbl: UIView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
     print("finding location..")
        indicator.startAnimating();
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()


        
       



        
                    //Check if location services are available
               if CLLocationManager.locationServicesEnabled() {
                   locationManager.delegate = self
                   locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                   locationManager.startUpdatingLocation()
               }
               
            

      

    }

        

        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("i m inside location manager")
        guard let location = locations.last else { return }
        print("Current location: \(location)")
        locationManager.stopUpdatingLocation()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Patient_Login_ViewController") as! Patient_Login_ViewController
        
        present(viewController, animated: true, completion: nil)
        
        indicator.isHidden = true
    }
        

    
    

   
    }




