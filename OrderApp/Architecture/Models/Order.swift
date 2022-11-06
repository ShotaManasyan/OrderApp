//
//  Order.swift
//  OrderApp
//
//  Created by Shota Manasyan on 03.11.22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
