//
//  SecondView.swift
//  NavigationProblem
//
//  Created by Michael Luegmayer on 08.11.22.
//

import SwiftUI

struct SecondView: View {
    
    @State private var columnVisibility: NavigationSplitViewVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            Text("Test")
                .navigationTitle("Dashboard")
                .navigationBarTitleDisplayMode(.large)
        } content: {
            Text("Test")
        }detail: {
            Text("Test")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            .previewDisplayName("iPad Pro")
            .previewInterfaceOrientation(.landscapeLeft)
        SecondView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
    }
}
