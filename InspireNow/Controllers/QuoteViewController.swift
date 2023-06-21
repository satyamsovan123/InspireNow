//
//  ViewController.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 20/06/23.
//

import UIKit

// The QuoteView shows quote owner's name, quote and a show more button in the bottom
class QuoteViewController: UIViewController {

    // Reference to UI elements
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var quoteText: UITextView!
    @IBOutlet weak var quoteOwner: UILabel!
    
    // Initializing models
    let quoteBrain = QuoteBrain()
    var currentQuoteText: String = ""
    var currentQuoteOwner: String = ""
    
    // On load, calling the setUI() method to set the UI
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI(currentQuoteOwner: currentQuoteOwner, currentQuoteText: currentQuoteText)
    }

    // This method is called when show more button is pressed
    // It segues to QuoteListView, and since we don't need to pass any information, there is no need for overrding prepare method
    @IBAction func showMoreButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showQuoteList", sender: self)
    }
    
    // This method identifies the segue and currently, it's chilling 😎 here and doing nothing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // This method sets the UI
    // Firstly, this method is called by this view to set the UI elements (at which currentQuoteText, currentQuoteOwner are blank), therefore random quote is shown
    // This method can be then called QuoteListView (as there is a segue to this view), therefore QuoteListView sets the values (currentQuoteText, currentQuoteOwner)
    func setUI(currentQuoteOwner: String, currentQuoteText: String) {
        let quote: Quote = quoteBrain.getARandomQuote() // Random quote is fetched using the quoteBrain
        if(self.currentQuoteOwner == "" || self.currentQuoteText == "") { // If, (currently) property is blank, then getting values randomly
            self.currentQuoteOwner = quote.quoteOwner // Getting the value from a random quote
            self.currentQuoteText = quote.quoteText // Getting the value from a random quote
        } else { // else, (currently) property is not blank, therefore, getting values from function parameter (i.e. segue initiator is calling this method)
            self.currentQuoteOwner = currentQuoteOwner // Getting the value from the function parameter (i.e. segue initiator)
            self.currentQuoteText = currentQuoteText // Getting the value from the function parameter (i.e. segue initiator)
        }
        
        quoteOwner.text = self.currentQuoteOwner // Setting the owner
        quoteText.text = self.currentQuoteText // Setting the text
    
    }
    
}

