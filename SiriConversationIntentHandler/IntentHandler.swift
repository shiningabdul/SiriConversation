//
//  IntentHandler.swift
//  SiriConversationIntentHandler
//
//  Created by Abdul Aljebouri on 2020-03-01.
//  Copyright © 2020 shiningdevelopers. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        if intent is OrderPizzaIntent {
            return OrderPizzaIntentHandler()
        }
        
        return self
    }
    
}
