//
//  Tab.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/07.
//

import Foundation

//bottm tab'
enum Tab : String, CaseIterable {
    //image name
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notifications = "bell"
    case Cart = "bag"
    case Profile = "person"

    var tabName : String {
        switch self {
        case .Home :
            return "Home"
        case .Search :
            return "Search"
        case .Notifications :
            return "Notifications"
        case .Cart :
            return "Cart"
        case .Profile :
            return "Profile"
        }
    }
}



