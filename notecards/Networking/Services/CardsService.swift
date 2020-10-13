//
//  CardsService.swift
//  notecards
//
//  Created by Luke Fitzgerald on 9/19/20.
//  Copyright © 2020 Luke Fitzgerald. All rights reserved.
//

import Foundation
import Alamofire

struct CardsService {
    var deserializer: CardsServiceDeserializerProtocol
    
    init(deserializer: CardsServiceDeserializerProtocol = CardsServiceDeserializer()) {
        self.deserializer = deserializer
    }
    
    func getCards(completionHandler: (([Card]?, Error?) -> Void)?) {
        let endpoint = buildEndpoint()
        let headers: HTTPHeaders = [ "x-api-key": ApiClient.apiKey ]
        var data : [Card] = []
        
        print("Network Request: \(endpoint)")
        AF.request(endpoint, headers: headers).responseJSON { responseJSON in
                    switch responseJSON.result {
                        case .success:
                            if let safeData = responseJSON.data {
                                data = self.parseJSON(cardData: safeData)
                            }
                            
                            completionHandler?(data, nil)
                        case let .failure(error):
                            print(error)
                            completionHandler?(nil, error)
                    }
        }
    }
    
    func parseJSON(cardData: Data) -> [Card] {
        let decoder = JSONDecoder()

        do {
            let decodedData = try decoder.decode(CardRequest.self, from: cardData)
            return decodedData.body
        } catch  {
            print("Error decoding JSON")
            print(error)
        }
        
        return []
    }
    
    private func buildEndpoint() -> URL {
        return URL(string: "\(ApiClient.baseUrl)/cards")!
    }
}

