//
//  Functions.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI

func isSplit() -> Bool {
    guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return false }
    
    return screen.windows.first?.frame.size != screen.screen.bounds.size
}
