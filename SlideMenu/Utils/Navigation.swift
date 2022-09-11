//
//  Navigation.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI

enum ViewTypes {
    case home
    case screen1
    case screen2
}

class SidebarNavigationManager: ObservableObject {
    @Published var viewType: ViewTypes = .home
}
