//
//  ContentView.swift
//  ALOMAps
//
//  Created by Alonso Jose on 2/25/21.
//  Copyright © 2021 Alonso Jose. All rights reserved.
//
import MapKit
import SwiftUI

import Foundation




extension MKPointAnnotation {
    static var que: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "mina Quellaveco"
        annotation.subtitle = "campamento minero"
        annotation.coordinate = CLLocationCoordinate2D(latitude:  -17.1044, longitude: -70.6236)
        return annotation
    }
}
struct ContentView: View {

    
  @State private var centerCoordinate = CLLocationCoordinate2D()
   @State private var locations = [MKPointAnnotation]()
    @State private var showTitle = true
    @available(iOS 14.0, *)
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )
    
    var body: some View {

        ZStack {
            MapView.self(  centerCoordinate: $centerCoordinate, annotations: [MKPointAnnotation.que])
                
                .edgesIgnoringSafeArea(.all)
  
            Text("\(centerCoordinate.latitude)-\(centerCoordinate.longitude)")
                .font(.callout)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(10)
                .opacity(showTitle ? 0 : 1)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
                    
                    .onTapGesture {
                    showTitle.toggle()
                        }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        
    }
}

