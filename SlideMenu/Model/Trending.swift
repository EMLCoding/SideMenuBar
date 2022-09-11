//
//  Trending.swift
//  SlideMenu
//
//  Created by Eduardo Martin Lorenzo on 11/9/22.
//

import SwiftUI

struct Trending: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var subTitle: String
    var count: Int
    var image: String
}

var trendingDishes: [Trending] = [
    Trending(title: "American Favourite", subTitle: "Order", count: 120, image: "carrot.fill"),
    Trending(title: "Super supreme", subTitle: "Order", count: 90, image: "carrot.fill"),
    Trending(title: "Orange Juice", subTitle: "Order", count: 110, image: "carrot.fill"),
    Trending(title: "Chicken Mushroom", subTitle: "Order", count: 70, image: "carrot.fill")
]
