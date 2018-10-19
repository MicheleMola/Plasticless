//
//  InterestPointViews.swift
//  Plasticless
//
//  Created by Emilio Arvonio on 18/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import MapKit

class PointMarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      // 1
      guard let point = newValue as? InterestPointAnnotation else { return }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
      // 2
      markerTintColor = point.markerTintColor
    }
  }
}

