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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self as UITextFieldDelegate
     
    }
    
    // - MARK : IBACTIONS

    @IBAction func searchButtonIsTaped(_ sender: Any) {
        let networkRequest = NetworkService()
        networkRequest.makeAPIRequest(self.searchBar.text!) { (Term) in
            print(Term.definition)
            DispatchQueue.main.async {
                guard let definition = Term.definition else {return}
                print(definition)
                self.textView.text = definition
            }
        }
    }
    

}
