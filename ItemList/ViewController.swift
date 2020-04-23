//
//  ViewController.swift
//  ItemList
//
//  Created by Agustin Mendoza Romo on 4/22/20.
//  Copyright © 2020 Agustin Mendoza Romo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var itemList = """
    {
        "items": [
            {
                "name": "Sprint",
                "type": "Book",
                "description": "All natural",
                "author": "Jake Knapp",
                "year_published": 2010
            },
            {
                "name": "Accord",
                "type": "Car",
                "description": "",
                "maker": "Honda",
                "year": 2015
            },
            {
                "name": "Angela's phone",
                "type": "Phone",
                "description": "Best phone of 2018",
                "model": "Samsung Galaxy Note",
                "os": "Android"
            },{
                "name": "Masked Prey",
                "type": "Book",
                "description": "The 30th book in the Prey series. Washington politicians ask Lucas ",
                "author": "John Sanford",
                "year_published": 2020
            },
            {
                "name": "Michaels's phone",
                "type": "Phone",
                "description": "The best phone for people who don't want to spend a bundle",
                "model": "iPhone 11",
                "os": "iOS"
            },
            {
                "name": "Corolla",
                "type": "Car",
                "description": "",
                "maker": "Toyota",
                "year": 2010
            },
            {
                "name": "Eric's phone",
                "type": "Phone",
                "description": "The OnePlus 8 Pro is a fantastic value because it packs so many features into a phone that costs less",
                "model": "OnePlus 8 Pro",
                "os": "Android"
            }
        ]
    }
    """

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder = JSONDecoder()
        do {
            let results = try jsonDecoder.decode(Items.self, from:itemList.data(using: .utf8)!)
            for result in results.items {
                print(result.description)
                if let car = result as? Car {
                    print(car.maker, car.name, car.description)
                }
                if let phone = result as? Phone {
                    print(phone.model, phone.name, phone.description, phone.operatingSystem)
                }
                if let book = result as? Book {
                    print(book.author, book.name, book.description, book.yearPublished)
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }


    
    
}

