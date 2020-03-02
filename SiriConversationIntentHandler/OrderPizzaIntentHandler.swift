//
//  OrderPizzaIntentHandler.swift
//  SiriConversationIntentHandler
//
//  Created by Abdul Aljebouri on 2020-03-01.
//  Copyright © 2020 shiningdevelopers. All rights reserved.
//

import Foundation
import Intents

class OrderPizzaIntentHandler: NSObject, OrderPizzaIntentHandling {
    func confirm(intent: OrderPizzaIntent, completion: @escaping (OrderPizzaIntentResponse) -> Void) {
        completion(OrderPizzaIntentResponse(code: .ready, userActivity: nil))
    }

    func handle(intent: OrderPizzaIntent, completion: @escaping (OrderPizzaIntentResponse) -> Void) {
        guard intent.topping != nil else {
            completion(OrderPizzaIntentResponse(code: .failure, userActivity: nil))
            return
        }

        let amount = INCurrencyAmount(amount: NSDecimalNumber(decimal: 23.14), currencyCode: "CAD")
        completion(.success(total: amount))
    }

    func resolveTopping(for intent: OrderPizzaIntent, with completion: @escaping (OrderPizzaToppingResolutionResult) -> Void) {
        guard let topping = intent.topping, !topping.isEmpty else {
            completion(.needsValue())
            return
        }

        guard topping.lowercased() == "pepperoni" else {
            completion(.unsupported(forReason: .ingrediantNotAvailable))
            return
        }

        completion(.success(with: topping))
    }
}
