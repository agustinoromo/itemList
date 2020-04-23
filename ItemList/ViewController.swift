//
//  ViewController.swift
//  ItemList
//
//  Created by Agustin Mendoza Romo on 4/22/20.
//  Copyright © 2020 Agustin Mendoza Romo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        parseJSON()
    }
    
    private func setupSubViews() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func parseJSON() {
        if let path = Bundle.main.path(forResource: "MockItemResponse", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                let results = try jsonDecoder.decode(Items.self, from:data)
                self.items = results.items
                self.tableView.reloadData()
            } catch {
                print("Error: \(error)")
            }
            
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else { return UITableViewCell() }
        cell.setup(for: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

