//
//  ResponsiveView.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI
import Foundation

struct ResponsiveView<Content: View>: View {
    // Permite que al llamar a esta View, devuelva a lo contenga una serie de propiedades
    var content: (Properties) -> Content
    
    init(@ViewBuilder content: @escaping (Properties) -> Content) {
        self.content = content
    }
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let isLandscape = size.width > size.height
            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
            let isMaxSplit = isSplit() && size.width < 400
            // Cuando la tablet este en modo vertical el menu lateral estara escondido. Si esta en horizontal sera visible
            let isAdoptable = isIpad && (isLandscape ? !isMaxSplit : !isSplit())
            
            let properties = Properties(isLandscape: isLandscape, isIpad: isIpad, isSplit: isSplit(), isMaxSplit: isMaxSplit, isAdoptable: isAdoptable, size: size)
            
            content(properties)
                .frame(width: size.width, height: size.height)
        }
    }
    
    
}

struct ResponsiveView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Properties {
    var isLandscape: Bool
    var isIpad: Bool
    var isSplit: Bool
    // MARK: Si el tamaño de la App es reducido mas de 1/3 en el modo split del iPad
    var isMaxSplit: Bool
    var isAdoptable: Bool
    var size: CGSize
}
