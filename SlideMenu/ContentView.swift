//
//  ContentView.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ResponsiveView { props in
            Home(props: props)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
