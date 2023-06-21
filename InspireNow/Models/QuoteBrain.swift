//
//  QuoteBrain.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 21/06/23.
//

import Foundation

struct QuoteBrain {
    let quoteList: [Quote] = [
        Quote(quoteOwner: "Steve Jobs", quoteText: "Stay hungry, stay foolish."),
        Quote(quoteOwner: "Steve Jobs", quoteText: "Design is not just what it looks like and feels like. Design is how it works."),
        Quote(quoteOwner: "Steve Jobs", quoteText: "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work."),
        Quote(quoteOwner: "Steve Jobs", quoteText: "The people who are crazy enough to think they can change the world are the ones who do."),
    ]
    
    func getARandomQuote() -> Quote {
        let randomQuote = quoteList.randomElement()
        // print(randomQuote)
        return randomQuote!
    }
}
