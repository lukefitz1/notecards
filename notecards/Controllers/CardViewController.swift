//
//  CardViewController.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/20/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Variables
    var cards: [Card] = []
    var testType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        
    }
}
