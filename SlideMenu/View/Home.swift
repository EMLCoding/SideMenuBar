//
//  Home.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI

struct Home: View {
    var props: Properties
    
    @StateObject var navigationManager = SidebarNavigationManager()
    
    @State var currentTab: String = "Home"
    @State var showSideBar: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            if props.isAdoptable {
                SideBar(navigationManager: navigationManager, currentTab: $currentTab)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HeaderView()
                    switch navigationManager.viewType {
                    case .home:
                        HomeView()
                    case .screen1:
                        Screen1View()
                    case .screen2:
                        Screen2View()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Puede que no sea necesario
                .padding(15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .overlay(alignment: .leading) {
            if !props.isAdoptable {
                SideBar(navigationManager: navigationManager, currentTab: $currentTab)
                    .offset(x: showSideBar ? 0 : -100)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background {
                        Color.black
                            .opacity(showSideBar ? 0.25 : 0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    showSideBar.toggle()
                                }
                            }
                    }
            }
            
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        // Con esto se consigue crear una vista que variará automaticamente entre horizontal y vertical en funcion de los booleanos utilizados.
        let layout = props.isIpad && !props.isMaxSplit ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout(spacing: 22))
        
        layout {
            HStack {
                if !props.isAdoptable {
                    Image(systemName: "line.3.horizontal")
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                showSideBar.toggle()
                            }
                        }
                }
                
                VStack {
                    Text("Welcome")
                        .font(.title3)
                    
                    Text("Ready to work?")
                        .font(.caption)
                        .foregroundColor(Color.gray.opacity(0.5))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Image(systemName: "chart.line.uptrend.xyaxis.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
