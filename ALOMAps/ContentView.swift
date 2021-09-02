//
//  ContentView.swift
//  ALOMAps
//
//  Created by Alonso Jose on 2/25/21.
//  Copyright © 2021 Alonso Jose. All rights reserved.
//
import MapKit
import SwiftUI

struct ContentView: View {
  @State private var centerCoordinate = CLLocationCoordinate2D()
   @State private var locations = [MKPointAnnotation]()
    
    var body: some View {
    
        ZStack {
            MapView.self(centerCoordinate: $centerCoordinate, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
