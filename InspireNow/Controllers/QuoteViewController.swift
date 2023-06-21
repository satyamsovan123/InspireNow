//
//  ViewController.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 20/06/23.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var quoteText: UITextView!
    @IBOutlet weak var quoteOwner: UILabel!
    
    
    
    let quoteBrain = QuoteBrain()
    
    var currentQuoteText: String = ""
    var currentQuoteOwner: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI(currentQuoteOwner: currentQuoteOwner, currentQuoteText: currentQuoteText)
    }

    @IBAction func showMoreButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showQuoteList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
    }
    
    func generateRandomQuote() -> Quote {
        let quote: Quote = quoteBrain.getARandomQuote()
        return quote
    }
    
    func setUI(currentQuoteOwner: String, currentQuoteText: String) {
        var quote: Quote = quoteBrain.defaultQuote
        if(self.currentQuoteOwner == "" || self.currentQuoteText == "") {
            quote = generateRandomQuote()
            self.currentQuoteOwner = quote.quoteOwner
            self.currentQuoteText = quote.quoteText
        } else {
            self.currentQuoteOwner = currentQuoteOwner
            self.currentQuoteText = currentQuoteText
        }
        
        quoteText.text = self.currentQuoteText
        quoteOwner.text = self.currentQuoteOwner
    }
    
}

