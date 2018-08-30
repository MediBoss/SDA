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
        self.searchBar.delegate = self as? UITextFieldDelegate
        let term = "hello"
        let network = NetworkService()
        network.makeAPIRequest(term) { (term) in
            //stuff
        }
       
    }
    
    // - MARK : IBACTIONS
    @IBAction func searchButtonIsTaped(_ sender: UIButton) {

    }


}
