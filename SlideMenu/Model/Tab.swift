//
//  Tab.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI

struct Tab: Identifiable {
    var id = UUID()
    var icon: String
    var text: String
    var screen: ViewTypes
}

var tabs:[Tab] = [
    .init(icon: "house", text: "Home", screen: .home),
    .init(icon: "square.grid.2x2", text: "Dashboard", screen: .screen1),
    .init(icon: "list.bullet.rectangle.portrait", text: "Projects", screen: .screen2),
]
