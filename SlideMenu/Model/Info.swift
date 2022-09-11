//
//  Info.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI

struct Info: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var amount: String
    var percentage: Int
    var loss: Bool = false
    var icon: String
    var iconColor: Color
}

var infos: [Info] = [
    Info(title: "Revenue", amount: "$2.046", percentage: 10, loss: true, icon: "arrow.up", iconColor: Color.orange),
    Info(title: "Orders", amount: "356", percentage: 20, icon: "cart", iconColor: Color.green),
    Info(title: "Dine in", amount: "220", percentage: 10, icon: "fork.knife", iconColor: Color.red),
    Info(title: "Take away", amount: "135", percentage: 5, loss: true, icon: "takeoutbag.and.cup.and.straw", iconColor: Color.yellow)
]

