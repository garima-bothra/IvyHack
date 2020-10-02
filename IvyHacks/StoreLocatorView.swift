//
//  StoreLocatorView.swift
//  IvyHacks
//
//  Created by Garima Bothra on 02/10/20.
//

import SwiftUI
import MapKit

struct StoreLocatorView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct StoreLocatorView_Previews: PreviewProvider {
    static var previews: some View {
        StoreLocatorView()
    }
}
