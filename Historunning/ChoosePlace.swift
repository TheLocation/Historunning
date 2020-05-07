//
//  ChoosePlace.swift
//  Historunning
//
//  Created by Matteo Postorino on 01/05/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import UIKit
import MapKit

@available(iOS 13.0, *)

class histoRun: UIViewController{

@IBOutlet private var mapView: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 43.727243, longitude: 10.416243)

        mapView.centerToLocation(initialLocation)
        // Do any additional setup after loading the view.
        
        let homeCenter = CLLocation(latitude: 43.727243, longitude: 10.416243)
        
        let region = MKCoordinateRegion(
          center: homeCenter.coordinate,
          latitudinalMeters: 50000,
          longitudinalMeters: 60000)
        
        mapView.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        
        mapView.setCameraZoomRange(zoomRange, animated: true)
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
