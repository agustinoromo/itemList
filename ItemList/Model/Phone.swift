//
//  Phone.swift
//  ItemList
//
//  Created by Agustin Mendoza Romo on 4/22/20.
//  Copyright © 2020 Agustin Mendoza Romo. All rights reserved.
//

import Foundation

class Phone: Item {
    var model: String
    var operatingSystem: String
    
    private enum CodingKeys: String, CodingKey {
        case model
        case operatingSystem = "os"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decode(String.self, forKey: .model)
        self.operatingSystem = try container.decode(String.self, forKey: .operatingSystem)
        try super.init(from: decoder)
    }
}
