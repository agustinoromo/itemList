//
//  Car.swift
//  ItemList
//
//  Created by Agustin Mendoza Romo on 4/22/20.
//  Copyright © 2020 Agustin Mendoza Romo. All rights reserved.
//

import Foundation

class Car: Item {
    var maker: String
    var year: Int

    private enum CodingKeys: String, CodingKey {
        case maker, year
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maker = try container.decode(String.self, forKey: .maker)
        self.year = try container.decode(Int.self, forKey: .year)
        try super.init(from: decoder)
    }
}
