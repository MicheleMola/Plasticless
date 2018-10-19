//
//  InterestPointAnnotation.swift
//  Plasticless
//
//  Created by Emilio Arvonio on 17/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import MapKit
import Contacts

class InterestPointAnnotation: NSObject, MKAnnotation {
  let title: String?
  let details: String
  let type: String
  let interestPoint: InterestPoint
  let coordinate: CLLocationCoordinate2D
  
  init(interestPoint: InterestPoint) {
    self.interestPoint = interestPoint
    self.coordinate = CLLocationCoordinate2D(latitude: interestPoint.latitude, longitude: interestPoint.longitude)
    self.title = interestPoint.name
    self.details = interestPoint.description
    self.type = interestPoint.type
    
    super.init()
  }
  
  var subtitle: String? {
    return details
  }
  
  // markerTintColor for disciplines: Sculpture, Plaque, Mural, Monument, other
  var markerTintColor: UIColor  {
    switch type {
    case "Bin":
      return .red
    case "Event":
      return .green
    case "Collection":
      return .blue
    default:
      return .red
    }
  }

  
  // Annotation right callout accessory opens this mapItem in Maps app
  func mapItem() -> MKMapItem {
    let addressDict = [CNPostalAddressStreetKey: subtitle!]
    let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = title
    return mapItem
  }

  
}
