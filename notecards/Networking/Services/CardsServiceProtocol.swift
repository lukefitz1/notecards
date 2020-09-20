//
//  CardsServiceProtocol.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/19/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import Foundation

protocol CardsServiceProtocol {
    func getCards(completionHandler: (([Card]?, Error?) -> Void)?)
}

extension CardsService: CardsServiceProtocol {}
