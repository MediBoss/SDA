//
//  MainMenuVC+Textfiled.swift
//  SDA
//
//  Created by Medi Assumani on 8/29/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

extension MainVC: UITextFieldDelegate{
        // Making sure that when the user taps "return", the keyboard goes away
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case searchBar:
            searchBar.resignFirstResponder()
            
        default:
            searchBar.resignFirstResponder()
        }
        return true
    }
}
