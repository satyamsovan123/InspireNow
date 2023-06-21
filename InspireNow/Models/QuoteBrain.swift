//
//  QuoteBrain.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 21/06/23.
//

import Foundation

struct QuoteBrain {
    var currentQuoteIndex: Int = 0
    
    let defaultQuote: Quote = Quote(quoteOwner: "Quote owner", quoteText: "Quote text")
    
    let quoteList: [Quote] = [
        Quote(quoteOwner: "Alan Kay", quoteText: "People who are really serious about software should make their own hardware."),
        Quote(quoteOwner: "Steve Jobs", quoteText: "The people who are crazy enough to think they can change the world are the ones who do."),
        Quote(quoteOwner: "Tim Cook", quoteText: "I think that everyone ought to be treated with dignity and respect, and that everyone has a unique voice that deserves to be heard."),
        Quote(quoteOwner: "Jony Ive", quoteText: "Simplicity is not the absence of clutter, but the presence of meaning."),
        Quote(quoteOwner: "Albert Einstein", quoteText: "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe."),
    ]
    
    func getARandomQuote() -> Quote {
        let randomQuote: Quote? = quoteList.randomElement()
        // print(randomQuote)
        return randomQuote!
    }
    
    func getAllQuoteOwners() -> [String] {
        var quoteOwners: [String] = []
        for quote: Quote in quoteList {
            quoteOwners.append(appendConstantToText(quote.quoteOwner))
        }
        return quoteOwners
    }
    
    func appendConstantToText(_ quoteText: String) -> String {
        return "\(quoteText)'s quote"
    }
    
    func removeConstantFromText(_ quoteText: String) -> String {
        let quoteOwner = quoteText.split(separator: "\'s")
        return String(quoteOwner[0])
    }
    
    func getQuoteFromQuoteList(_ quoteOwner: String) -> Quote {
        var currentQuote: Quote = defaultQuote
        for quote: Quote in quoteList {
            
            if(quote.quoteOwner == quoteOwner) {
                // print(quote)
                currentQuote = quote
            }
        }
        return currentQuote
    }
    
}
