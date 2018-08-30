//
//  MainVC.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class MainVC: UIViewController{

    // - MARK : IBOULETS
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self as UITextFieldDelegate

    }

    // - MARK : IBACTIONS

    @IBAction func searchButtonIsTaped(_ sender: Any) {
        guard let word = self.searchBar.text else {return}
        let networkRequest = NetworkService()

        networkRequest.makeAPIRequest(word) { (Term) in
            guard let definition = Term.definition else {return}
            DispatchQueue.main.async {
                self.textView.text = definition
            }
        }
    }
}
