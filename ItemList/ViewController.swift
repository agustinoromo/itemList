//
//  ViewController.swift
//  ItemList
//
//  Created by Agustin Mendoza Romo on 4/22/20.
//  Copyright © 2020 Agustin Mendoza Romo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        
    }

    private func parseJSON() {
        if let path = Bundle.main.path(forResource: "MockItemResponse", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                let results = try jsonDecoder.decode(Items.self, from:data)
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
    
}

