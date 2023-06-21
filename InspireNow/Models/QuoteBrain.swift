//
//  QuoteBrain.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 21/06/23.
//

import Foundation

// Quote brain handles the logic related quotes
struct QuoteBrain {
    // Default quote
    let defaultQuote: Quote = Quote(quoteOwner: "", quoteText: "")
    
    // Constant quote lists
    let quoteList: [Quote] = [
        Quote(quoteOwner: "Alan Kay", quoteText: "People who are really serious about software should make their own hardware."),
        Quote(quoteOwner: "Albert Einstein", quoteText: "Two things are infinite: the universe and human stupidity, and I'm not sure about the universe."),
        Quote(quoteOwner: "Jony Ive", quoteText: "Simplicity is not the absence of clutter, but the presence of meaning."),
        Quote(quoteOwner: "Mahatma Gandhi", quoteText: "Be the change that you wish to see in the world."),
        Quote(quoteOwner: "Steve Jobs", quoteText: "The people who are crazy enough to think they can change the world are the ones who do."),
        Quote(quoteOwner: "Tim Cook", quoteText: "I think that everyone ought to be treated with dignity and respect, and that everyone has a unique voice that deserves to be heard.")
    ]
    
    // Method to get a random quote
    func getARandomQuote() -> Quote {
        let randomQuote: Quote? = quoteList.randomElement()
        return randomQuote!
    }
    
    // Method to get the all quoteOwner properties from Quote list
    func getAllQuoteOwners() -> [String] {
        var quoteOwners: [String] = []
        for quote: Quote in quoteList {
            quoteOwners.append(appendConstantToText(quote.quoteOwner))
        }
        return quoteOwners
    }
    
    // Method to add "'s quote" at the end of a given quote owner
    func appendConstantToText(_ quoteText: String) -> String {
        return "\(quoteText)'s quote"
    }
    
    // Method to remove "'s quote" from the end of a given quote owner
    func removeConstantFromText(_ quoteText: String) -> String {
        let quoteOwner = quoteText.split(separator: "\'s")
        return String(quoteOwner[0])
    }
    
    // Method to get quote from given quote owner
    // It returns default quote, where nothing apart from show more button would be shown to user
    func getQuoteFromQuoteList(_ quoteOwner: String) -> Quote {
        var currentQuote: Quote = defaultQuote
        for quote: Quote in quoteList {
            if(quote.quoteOwner == quoteOwner) {
                currentQuote = quote
            }
        }
        return currentQuote
    }
    
}
