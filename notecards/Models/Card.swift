//
//  Card.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/19/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import Foundation

struct CardRequest: Decodable {
    let statusCode: Int
    let body: [Card]
}

struct Card: Decodable {
    let id: String
    let frontOfCard: String?
    let backOfCard: String?
    let type: String?
    let numberOfAnswers: Int?
    let answerType: String?
    let tests: [String]
    let services: [String]
    let answers: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case frontOfCard = "front_of_card"
        case backOfCard = "back_of_card"
        case type
        case numberOfAnswers = "number_of_answers"
        case answerType = "answer_type"
        case tests
        case services
        case answers
    }
}
