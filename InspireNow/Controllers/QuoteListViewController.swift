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
    @IBOutlet weak var mainView: UIStackView! // This is where buttons should be placed at
    
    let backSymbol = UIImage(systemName: "arrowshape.backward") // Back symbol for back button
    
    // Initializing models
    var quoteBrain: QuoteBrain = QuoteBrain()
    var selectedOwnerQuote: Quote?
    
    // On load, calling the setUI() method to set the UI
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
    
    // This method creates button and sets them in the UI
    // It generates the same number of button as the number of elements in the quoteOwners list
    func setUI() -> Void {
        let quoteOwners: [String] = quoteBrain.getAllQuoteOwners()
        // Looping through the array of owner's name and then generating button for each owner
        for quoteOwner: String in quoteOwners {
            // Generating a button dynamically in the UI
            createButton(title: quoteOwner)
        }
        createButton(title: "Back") // Generating a back button after all generating owner name's button
    }
    
    // This method creates a button with a given title
    // It also works with auto layout
    func createButton(title: String) -> Void {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        // Adding accessibilities
        let quoteOwner: String = quoteBrain.removeConstantFromText(title)
        button.accessibilityLabel = "Quote owner's name button"
        button.accessibilityHint = "Tap this button to display a quote from \(quoteOwner)."
        
        // Auto layout
        let buttonHeightConstraint: NSLayoutConstraint = button.heightAnchor.constraint(lessThanOrEqualToConstant: 40)

        // For back button, we are using image, so we need to style it separately
        if(title == "Back") {
            button.setImage(backSymbol, for: .normal)
            button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside) // Defining behaviour on tap of back button
        } else { // If title is not "Back" i.e for quote owner name buttons
            button.setTitle(title, for: .normal)
            button.addTarget(self, action: #selector(quoteOwnerButtonPressed), for: .touchUpInside) // Defining behaviour on tap of quote owner's name button
        }
        buttonHeightConstraint.priority = .defaultHigh
        buttonHeightConstraint.isActive = true
        mainView.addArrangedSubview(button) // Adding button to the stack view
        // The stack view already has constraints created using InterfaceBuilder
    }
    
    // This method is called when any of the buttons having a quote owner name is tapped
    // The quote owner name is captured and the associated quote is then used further
    // It performs a segue back to the QuoteView by setting some properties
    @objc private func quoteOwnerButtonPressed(sender: UIButton) {
        let buttonLabel: String = sender.currentTitle ?? ""
        let quoteOwner: String = quoteBrain.removeConstantFromText(buttonLabel)
        selectedOwnerQuote = quoteBrain.getQuoteFromQuoteList(quoteOwner)
        performSegue(withIdentifier: "showQuote", sender: self)
    }
    
    // This method is called when back button is pressed
    // It dismisses this view
    @objc private func backButtonPressed(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
