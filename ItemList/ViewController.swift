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
                "name": "Carlsbad Dealer",
                "type": "Car",
                "description": "An alcoholic beverage, best drunk on fridays after work",
                "maker": "Honda",
                "year": 2015
            },
            {
                "name": "Angela's phone",
                "type": "Phone",
                "description": "Best phone of 2018",
                "model": "Samsung Galaxy Note",
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
            print("caught: \(error)")
        }
    }


    
    
}

