//
//  MapViewController.swift
//  Plasticless
//
//  Created by Emilio Arvonio on 15/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  let locationManager = CLLocationManager()
  
  let regionRadius: CLLocationDistance = 200
  
  var points: [InterestPoint] = []
  
  var annotationPoints: [InterestPointAnnotation] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self

    
    // set initial location in Honolulu
    let initialLocation = CLLocation(latitude: 40.836404, longitude: 14.306517)
    centerMapOnLocation(location: initialLocation)
    
    mapView.register(PointMarkerView.self,
                     forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

    
    do {
      self.points = try GenericCoder.decodeFromFile(withName: .InterestPoints) ?? []
    } catch let error {
      print(error)
    }
    
    for point in self.points {
      annotationPoints.append(InterestPointAnnotation(interestPoint: point))
    }
    //let pointer = InterestPointAnnotation(interestPoint: self.points[0])
    mapView.addAnnotations(annotationPoints)
    
    // Do any additional setup after loading the view.
  }
  
  
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                              latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
  
  func checkLocationAuthorizationStatus() {
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
      mapView.showsUserLocation = true
    } else {
      locationManager.requestWhenInUseAuthorization()
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    checkLocationAuthorizationStatus()
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

extension MapViewController: MKMapViewDelegate {
  
  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
               calloutAccessoryControlTapped control: UIControl) {
    let location = view.annotation as! InterestPointAnnotation
    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
    location.mapItem().openInMaps(launchOptions: launchOptions)
  }
  
  
}

