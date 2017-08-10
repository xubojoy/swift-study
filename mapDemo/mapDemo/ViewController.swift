//
//  ViewController.swift
//  mapDemo
//
//  Created by xubojoy on 2017/8/10.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let locationLabel = UILabel()
    let locationStrLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bgImgView = UIImageView(frame: view.bounds)
        bgImgView.image = #imageLiteral(resourceName: "phoneBg")
        view.addSubview(bgImgView)
        
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        view.addSubview(blurView)
        
        
        locationManager.delegate = self
        locationLabel.frame = CGRect(x: 0, y: 50, width: view.bounds.size.width, height: 300)
        
        locationLabel.textAlignment = .center
        locationLabel.textColor = .white
        locationLabel.numberOfLines = 0
        view.addSubview(locationLabel)
        
        
        locationStrLabel.frame = CGRect(x: 0, y: (locationLabel.frame.origin.y+locationLabel.frame.size.height), width: view.bounds.size.width, height: 200)
        locationStrLabel.textAlignment = .center
        locationStrLabel.textColor = .white
        locationStrLabel.numberOfLines = 0
        view.addSubview(locationStrLabel)
        
        let findMyLocationBtn = UIButton(type: .custom)
        findMyLocationBtn.frame = CGRect(x: 50, y: self.view.bounds.height - 80, width: self.view.bounds.width - 100, height: 50)
        findMyLocationBtn.setTitle("Find My Position", for: UIControlState.normal)
        findMyLocationBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        findMyLocationBtn.addTarget(self, action: #selector(findMyLocation), for: UIControlEvents.touchUpInside)
        self.view.addSubview(findMyLocationBtn)
    }
    
    func findMyLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations = locations
        let currentLocation = locations.last!
        
        print(currentLocation.coordinate.latitude)
        print(currentLocation.coordinate.longitude)
        
        self.locationLabel.text = String(format: "lat: \(currentLocation.coordinate.latitude)  long: \(currentLocation.coordinate.longitude)")
        
        reverseGeocode(location: currentLocation)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func reverseGeocode(location: CLLocation) {
        self.geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            print(placeMark!)
            let mark = placeMark?.first
            let addressDictionary = mark?.addressDictionary
            print("addressDictionary=====",addressDictionary!["Street"]!)
            
            self.locationStrLabel.text = addressDictionary!["Street"]! as? String
            
            let name = mark?.name
            print("name=====",name!)
            
            let thoroughfare = mark?.thoroughfare
            print("thoroughfare=====",thoroughfare!)
            
            let locality = mark?.locality
            print("locality=====",locality!)

            let subLocality = mark?.subLocality
            print("subLocality=====",subLocality!)
            

            let administrativeArea = mark?.administrativeArea
            print("administrativeArea=====",administrativeArea!)

//            let postalCode = mark?.postalCode
//            print("postalCode=====",postalCode!)
//
            let isoCountryCode = mark?.isoCountryCode
            print("isoCountryCode=====",isoCountryCode!)
            

            let country = mark?.country
            print("country=====",country!)
            

            
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

