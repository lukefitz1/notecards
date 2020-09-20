//
//  ServiceListViewController.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/20/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import UIKit

class ServiceListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    var cards: [Card] = []
    var services: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getServices()
    }
    
    // MARK: - Filter method
    
    func getServices() {
        let servicesName = Services()
        var serviceSet = Set<String>()
        
        cards.forEach { card in
            card.services.forEach { service in
                let serviceName = servicesName.getName(service: service)
                serviceSet.insert(serviceName)
            }
        }
        
        self.services = Array(serviceSet)
    }
    
    // MARK: - TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath)
        
        cell.textLabel?.text = services[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
