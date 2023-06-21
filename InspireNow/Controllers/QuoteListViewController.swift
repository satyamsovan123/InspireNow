//
//  QuoteListController.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 21/06/23.
//

import UIKit

class QuoteListViewController: UIViewController {

    @IBOutlet weak var asQuote: UIButton!
    @IBOutlet weak var bsQuote: UIButton!
    @IBOutlet weak var csQuote: UIButton!
    @IBOutlet weak var dsQuote: UIButton!
    
    var quoteBrain: QuoteBrain = QuoteBrain()
    var quoteOwners: [String] = []
    var selectedOwnerQuote: Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteOwners = quoteBrain.getAllQuoteOwners()
        setUI()
        // print(quoteOwners)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    func setUI() {
        asQuote.setTitle(quoteOwners[0], for: .normal)
        bsQuote.setTitle(quoteOwners[1], for: .normal)
        csQuote.setTitle(quoteOwners[2], for: .normal)
        dsQuote.setTitle(quoteOwners[3], for: .normal)
    }
    
    @IBAction func quoteOwnerButtonPressed(_ sender: UIButton) {
        let buttonLabel: String = sender.currentTitle ?? ""
        let quoteOwner: String = quoteBrain.removeConstantFromText(buttonLabel)
        selectedOwnerQuote = quoteBrain.getQuoteFromQuoteList(quoteOwner)
        performSegue(withIdentifier: "showQuote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defaultQuote: Quote = quoteBrain.defaultQuote
        if(segue.identifier == "showQuote") {
            let destinationVC = segue.destination as! QuoteViewController
            destinationVC.currentQuoteOwner = selectedOwnerQuote?.quoteOwner ?? defaultQuote.quoteOwner
            destinationVC.currentQuoteText = selectedOwnerQuote?.quoteText ?? defaultQuote.quoteText
            destinationVC.modalTransitionStyle = .crossDissolve
            destinationVC.modalPresentationStyle = .fullScreen
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
