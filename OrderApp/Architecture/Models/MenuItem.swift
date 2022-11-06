//
//  MenuItem.swift
//  OrderApp
//
//  Created by Shota Manasyan on 03.11.22.
//

import Foundation


struct MenuItem: Codable {
    let id: Int
    let name: String
    let detailText: String
    let price: Double
    let category: String
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
        
    }
}
