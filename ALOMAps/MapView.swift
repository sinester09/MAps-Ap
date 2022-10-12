//
//  MapView.swift
//  ALOMAps
//
//  Created by Alonso Jose on 2/25/21.
//  Copyright © 2021 Alonso Jose. All rights reserved.
//

import Foundation

import SwiftUI
import MapKit
import UIKit

var quellaveco: MKPointAnnotation {
    let annotation = MKPointAnnotation()
    annotation.title = "mina Quellaveco"
    annotation.subtitle = "campamento minero"
    annotation.coordinate = CLLocationCoordinate2D(latitude:  -17.1044, longitude: -70.6236)
    return annotation
}

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotations: [MKPointAnnotation]
   
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {

        if annotations.count != view.annotations.count {
               view.removeAnnotations(view.annotations)
               view.addAnnotations(annotations)
   
           }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
    }
    
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "mina Quellaveco"
        annotation.subtitle = "campamento minero"
        annotation.coordinate = CLLocationCoordinate2D(latitude:  -17.1044, longitude: -70.6236)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
  
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), annotations: [MKPointAnnotation.example])
    }
}
