//
//  ViewController.swift
//  InspireNow
//
//  Created by Satyam Sovan Mishra on 20/06/23.
//

import UIKit

class QuoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMoreButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showQuoteList", sender: self)
    }
    
}

