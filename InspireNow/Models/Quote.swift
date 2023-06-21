//
//  Quote.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 21/06/23.
//

import Foundation

// Quote model with properties and a initializer
struct Quote {
    let quoteOwner: String
    let quoteText: String
    
    init(quoteOwner: String, quoteText: String) {
        self.quoteOwner = quoteOwner
        self.quoteText = quoteText
    }
}
