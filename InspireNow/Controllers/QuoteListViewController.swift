//
//  QuoteListController.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 21/06/23.
//

import UIKit

// The QuoteListView has list of quote owner's name and a back button at the bottom
class QuoteListViewController: UIViewController {

    // Reference to UI elements
    @IBOutlet weak var asQuote: UIButton!
    @IBOutlet weak var bsQuote: UIButton!
    @IBOutlet weak var csQuote: UIButton!
    @IBOutlet weak var dsQuote: UIButton!
    
    // Initializing models
    var quoteBrain: QuoteBrain = QuoteBrain()
    var selectedOwnerQuote: Quote?
        
    // On load, calling the setUI() method to set the UI
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // This method is called when back button is pressed
    // It dismisses this view
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // This method is called when any of the buttons having a quote owner name is tapped
    // The quote owner name is captured and the associated quote is then used further
    // It performs a segue back to the QuoteView by setting some properties
    @IBAction func quoteOwnerButtonPressed(_ sender: UIButton) {
        let buttonLabel: String = sender.currentTitle ?? ""
        let quoteOwner: String = quoteBrain.removeConstantFromText(buttonLabel)
        selectedOwnerQuote = quoteBrain.getQuoteFromQuoteList(quoteOwner)
        performSegue(withIdentifier: "showQuote", sender: self)
    }
    
    // This method identifies the segue and sets the required property (currentQuoteOwner, currentQuoteText) in the QuoteView
    // It helps to pass the quote details (associated with the tap) to the QuoteView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defaultQuote: Quote = quoteBrain.defaultQuote
        if(segue.identifier == "showQuote") {
            let destinationVC = segue.destination as! QuoteViewController // Downcasting the view
            destinationVC.currentQuoteOwner = selectedOwnerQuote?.quoteOwner ?? defaultQuote.quoteOwner // Setting the property in the view
            destinationVC.currentQuoteText = selectedOwnerQuote?.quoteText ?? defaultQuote.quoteText // Setting the property in the view
            destinationVC.modalTransitionStyle = .crossDissolve // Setting the segue transition
            destinationVC.modalPresentationStyle = .fullScreen // Setting the presentation to fullscreen, as default can be dismissed by user
        }
    }
    
    // This method (currently static) sets the four buttons's title lable to quote owner's name
    func setUI() -> Void {
        let quoteOwners: [String] = quoteBrain.getAllQuoteOwners()
        
        // Looping through the array of owner's name and then generating button for each owner
        for quoteOwner: String in quoteOwners {
            // Generate a button dynamically in the UI
            createButton(title: quoteOwner)
        }
        asQuote.setTitle(quoteOwners[0], for: .normal)
        bsQuote.setTitle(quoteOwners[1], for: .normal)
        csQuote.setTitle(quoteOwners[2], for: .normal)
        dsQuote.setTitle(quoteOwners[3], for: .normal)
    }
    
    // This method creates a button with a given title
    func createButton(title: String) -> Void {
        print(title)
    }
}
