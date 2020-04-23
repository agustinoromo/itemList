//
//  Item.swift
//  ItemList
//
//  Created by Agustin Mendoza Romo on 4/22/20.
//  Copyright © 2020 Agustin Mendoza Romo. All rights reserved.
//

import Foundation

class Item: Decodable {
    var name: String
    var type: String
    var description: String

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case description
    }
}

struct Items: Decodable {
    let items: [Item]

    enum ItemsKey: CodingKey {
        case items
    }

    enum ItemTypeKey: CodingKey {
        case type
    }

    enum ItemTypes: String, Decodable {
        case book = "Book"
        case car = "Car"
        case phone = "Phone"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ItemsKey.self)
        var itemsArrayForType = try container.nestedUnkeyedContainer(forKey: ItemsKey.items)
        var items = [Item]()

        var itemsArray = itemsArrayForType
        while(!itemsArrayForType.isAtEnd)
        {
            let item = try itemsArrayForType.nestedContainer(keyedBy: ItemTypeKey.self)
            let type = try item.decode(ItemTypes.self, forKey: ItemTypeKey.type)
            switch type {
            case .car:
                items.append(try itemsArray.decode(Car.self))
            case .phone:
                items.append(try itemsArray.decode(Phone.self))
            case .book:
                items.append(try itemsArray.decode(Book.self))
            }
        }
        self.items = items
    }
}


