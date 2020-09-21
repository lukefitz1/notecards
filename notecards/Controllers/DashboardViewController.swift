//
//  DashboardViewController.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/19/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    // MARK: - Variables
    
    var cardsService: CardsServiceProtocol = CardsService()
    var progressHUD: MBProgressHUDProtocol = MBProgressHUDClient()
    var cardsArray: [Card] = []
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Class methods
    
    func setup() {
        progressHUD.show(onView: view, animated: true)
        
        cardsService.getCards { [weak self] cardData, error in
            guard let self = self else {
                return
            }
            
            defer {
                self.progressHUD.hide(onView: self.view, animated: true)
            }

            if let e = error {
                print("Error fetching card data - \(e)")
                return
            } else {
                if let data = cardData {
                    self.cardsArray = data
                }
            }
        }
    }

    // MARK: - IBActions
    
    @IBAction func saaBtnTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "SAASegue", sender: self)
    }

    @IBAction func cdaBtnTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "CDASegue", sender: self)
    }

    @IBAction func selectServiceBtnTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "ServiceListSegue", sender: self)
    }
    
    @IBAction func apisBtnTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "APISegue", sender: self)
    }

    // MARK: - Prepare for Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ServiceListSegue" {
            let destinationVC = segue.destination as! ServiceListViewController
            
            destinationVC.cards = cardsArray
        }
        
        if segue.identifier == "SAASegue" {
            let destinationVC = segue.destination as! CardViewController
            
            destinationVC.cards = cardsArray
            destinationVC.testType = "saa"
        }
        
        if segue.identifier == "CDASegue" {
            let destinationVC = segue.destination as! CardViewController
            
            destinationVC.cards = cardsArray
            destinationVC.testType = "cda"
        }
        
        if segue.identifier == "APISegue" {
            let destinationVC = segue.destination as! CardViewController
            
            destinationVC.cards = cardsArray
            destinationVC.testType = "api"
        }
    }
}
