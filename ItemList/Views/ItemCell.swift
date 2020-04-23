//
//  ItemCell.swift
//  ItemList
//
//  Created by Agustin Mendoza Romo on 4/22/20.
//  Copyright © 2020 Agustin Mendoza Romo. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPropertyMainLabel: UILabel!
    @IBOutlet weak var itemPropertySecondaryLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    

    func setup(for item: Item) {
        
        if let car = item as? Car {
            itemNameLabel.text = "\(car.maker), \(car.name)"
            itemPropertyMainLabel.text = "\(car.year)"
            itemPropertySecondaryLabel.isHidden = true
            itemImageView.image = UIImage(named: "car")
        }
        if let phone = item as? Phone {
            itemNameLabel.text = phone.model
             itemPropertyMainLabel.text = "\(phone.operatingSystem)"
            itemPropertySecondaryLabel.text = "\(phone.name)"
            itemImageView.image = UIImage(named: "cellphone")
        }
        if let book = item as? Book {
            itemNameLabel.text = "\(book.name)"
            itemPropertyMainLabel.text = "\(book.author), \(book.yearPublished)"
            itemImageView.image = UIImage(named: "book")
            
        }
        itemDescriptionLabel.isHidden = item.description == "" ? true : false
        itemDescriptionLabel.text = item.description
    }

}
