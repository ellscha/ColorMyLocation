//
//  ColorMyLocationViewController.swift
//  ColorMyLocation
//
//  Created by Elli Scharlin on 8/14/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

import UIKit
import QuartzCore
import CoreLocation

class ColorMyLocationViewController: UIViewController, CLLocationManagerDelegate {
    var delegate = UIApplication.sharedApplication().delegate as! AppDelegate //non-optional variable
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    var actualAltitude: Double = 0.0
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    var alphaProperty: Double = 0.0
    var altitude : Double = 0.0
    var redProperty: Double = 0.0
    var greenProperty: Double = 0.0
    var blueProperty: Double = 0.0
    var colorForLocation: UIColor
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    
    var locationManager : CLLocationManager!
    var geocoder: CLGeocoder!
    var placemark: CLPlacemark!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
        
        
        colorLabel.alpha = 1.0
        altitudeLabel.alpha = 1.0
        longitudeLabel.alpha = 1.0
        latitudeLabel.alpha = 1.0
        addressLabel.alpha = 1.0
        
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action:#selector(self.touchesDisplayGesture(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchesDisplayGesture(sender: UITapGestureRecognizer){
        if self.colorLabel.alpha == 0.0 {
            
            UIView.animateWithDuration(0.75, animations: {
                self.colorLabel.alpha = 1;
                self.altitudeLabel.alpha = 1;
                self.longitudeLabel.alpha = 1;
                self.latitudeLabel.alpha = 1;
                self.addressLabel.alpha = 1;
            })
            
        }
        else {
            UIView.animateWithDuration(0.75, animations: {
                self.colorLabel.alpha = 0;
                self.altitudeLabel.alpha = 0;
                self.longitudeLabel.alpha = 0;
                self.latitudeLabel.alpha = 0;
                self.addressLabel.alpha = 0;
            })
        }
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            
            let altitudeInInches: Double = fabs(location.altitude * 39.37)
            switch altitudeInInches {
            case let alt where alt <= 10.0:
                altitude = altitudeInInches/10
                
            case let alt where alt <= 100.0:
                altitude = altitudeInInches/100
                
            case let alt where alt <= 1000.0:
                altitude = altitudeInInches/1000
                
            case let alt where alt <= 10000.0:
                altitude = altitudeInInches/10000
                
            case let alt where alt <= 100000.0:
                altitude = altitudeInInches/100000
                
            default:
                self.altitude = altitudeInInches/1000000
                
            }
            
            if (location.coordinate.longitude <= 0) {
                self.longitude = (255.0 + location.coordinate.longitude)/255.000
            }
            else if (fabs(location.coordinate.longitude) > 0) {
                self.longitude = (255.0 - location.coordinate.longitude)/255.000
            }
            
            self.latitude = fabs(location.coordinate.latitude)/100;
            self.actualAltitude = location.altitude
            self.latitudeLabel.text = "Latitude: \(location.coordinate.latitude)"
            self.altitudeLabel.text = "Altitude: \(actualAltitude) m"
            self.longitudeLabel.text = "Longitude: \(location.coordinate.longitude)"
        }
        
        self.greenProperty = self.latitude
        self.redProperty = self.altitude
        self.blueProperty = self.longitude
        
        self.colorForLocation = UIColor.init(red: CGFloat(redProperty), green: CGFloat(greenProperty), blue: CGFloat(blueProperty), alpha: CGFloat(alphaProperty))
        
        self.view.backgroundColor = colorForLocation
        
        
        
        let colorRef: CGColorRef = colorForLocation.CGColor
        let countComponents = CGColorGetNumberOfComponents(colorRef)
        let redText : CGFloat
        let greenText : CGFloat
        let blueText : CGFloat
        if countComponents == 4 {
            let components = CGColorGetComponents(colorRef)
            let red = components[0]
            let green = components[1]
            let blue   = components[2]
            let alpha = components[3]
            
            
            self.colorLabel.text = "R:\(red)\nG:\(green)\nB:\(blue)"
            
            redText = 1-red
            greenText = 1-green
            blueText = 1-blue
            let textColor : UIColor = UIColor.init(red: redText, green: greenText, blue: blueText, alpha: alpha)
            self.colorLabel.textColor = textColor
            self.altitudeLabel.textColor = textColor
            self.longitudeLabel.textColor = textColor
            self.latitudeLabel.textColor = textColor
            self.addressLabel.textColor = textColor
            
            let location = CLLocation(latitude: latitude, longitude: longitude)
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                guard let
                error = error,
                placemarks = placemarks
                    else{ print ("error with geocoder"); return }
//                if error  nil {
//                    print("Reverse geocoder failed with error" + error.localizedDescription)
//                    return
//                }
                
                if placemarks.count > 0 {
                    let pm = placemarks[0] as CLPlacemark
                    print(pm.locality)
                    self.addressLabel.text = "\(pm.locality)"
                }
                else {
                    print("Problem with the data received from geocoder")
                }
            })
        }
        
        
        
    }
}

