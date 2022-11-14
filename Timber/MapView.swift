//
//  MapView.swift
//  Timber
//
//  Created by User15 on 11/14/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.038755430730085, longitude: 121.54992682641529), latitudinalMeters: 1000, longitudinalMeters: 1000)

    var body: some View {
      GeometryReader { geometry in
        Form {
          Text("Map")
            .font(Font.custom("CaviarDreams", size: 50))
          HStack {
            Spacer()
            Map(coordinateRegion: $region)
              .frame(width: geometry.size.width/1.4, height: geometry.size.height/1.4)
            Spacer()
          }
          Button {
              presentationMode.wrappedValue.dismiss()
          } label: {
              Label("返回", systemImage: "return")
          }
        }
      }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
