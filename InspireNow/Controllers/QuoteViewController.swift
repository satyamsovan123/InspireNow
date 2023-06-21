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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMoreButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showQuoteList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showQuoteList") {
            setUI()
        }
        
    }
    
    func setUI() {
        let quote: Quote = quoteBrain.getARandomQuote()
        quoteText.text = quote.quoteText
        quoteOwner.text = quote.quoteOwner
    }
    
}

