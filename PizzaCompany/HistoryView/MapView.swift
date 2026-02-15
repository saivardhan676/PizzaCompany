//
//  MapView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 15/02/26.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var latitude: CLLocationDistance
    var longitude: CLLocationDistance
    var regionRadius: CLLocationDistance = 1000
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        uiView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        uiView.addAnnotation(annotation)
    }
    
}
