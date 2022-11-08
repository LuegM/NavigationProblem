//
//  ContentView.swift
//  NavigationProblem
//
//  Created by Michael Luegmayer on 08.11.22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    private var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State private var columnVisibility: NavigationSplitViewVisibility = NavigationSplitViewVisibility.doubleColumn
    
    var body: some View {
        if idiom == .phone {
            NavigationStack {
                Map(coordinateRegion: $region)
                    .ignoresSafeArea()
                    .overlay {
                        NavigationLink(destination: SecondView()) {
                            Text("next View")
                                .font(.title)
                                .padding()
                                .background(.red)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }
            }
        } else {
            NavigationSplitView(columnVisibility: $columnVisibility) {
                Text("search")
            } detail: {
                Map(coordinateRegion: $region)
                            .ignoresSafeArea()
                            .overlay {
                                NavigationLink(destination: SecondView()) {
                                    Text("next View")
                                        .font(.title)
                                        .padding()
                                        .background(.red)
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                }
                            }
            }
            .navigationSplitViewStyle(.balanced)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
            .previewDisplayName("iPad Pro")
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
    }
}
