//
//  Book.swift
//  ItemList
//
//  Created by Agustin Mendoza Romo on 4/22/20.
//  Copyright © 2020 Agustin Mendoza Romo. All rights reserved.
//

import Foundation

class Book: Item {
    var author: String
    var yearPublished: Int
    
    private enum CodingKeys: String, CodingKey {
        case author
        case yearPublised = "year_published"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.author = try container.decode(String.self, forKey: .author)
        self.yearPublished = try container.decode(Int.self, forKey: .yearPublised)
        try super.init(from: decoder)
    }
}
