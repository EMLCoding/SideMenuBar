//
//  SideBar.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI

struct SideBar: View {
    @ObservedObject var navigationManager: SidebarNavigationManager
    
    @Binding var currentTab: String
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(tabs) { tab in
                        VStack(spacing: 8) {
                            Image(systemName: tab.icon)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 22, height: 22)
                            
                            Text(tab.text)
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(currentTab == tab.text ? .orange : .gray)
                        .padding(.vertical, 13)
                        .frame(width: 65)
                        .background {
                            if currentTab == tab.text {
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(Color.orange.opacity(0.1))
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                currentTab = tab.text
                                
                            }
                            navigationManager.viewType = tab.screen
                        }
                    }
                }
            }
        }
        .padding(.vertical)
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(width: 100)
        .background {
            Color.white
                .ignoresSafeArea()
        }
    }
    
}
