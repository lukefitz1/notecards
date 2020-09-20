//
//  CardsServiceDeserializer.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/19/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import Foundation

struct CardsServiceDeserializer {
    func deserialize(response: [String: Any]) -> [Card] {
        do {
            guard let dataResponse = response["body"] as? [String: Any],
            let responseArray = dataResponse["body"] else {
                return []
            }
            
            let data = try JSONSerialization.data(withJSONObject: responseArray)
            let deserializedCards = try JSONDecoder().decode([Card].self, from: data)
            return deserializedCards
        } catch {
            print("Error deserializing cards: \(error)")
        }

        return []
    }
}
