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
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var rootView: UIView!
        @IBOutlet weak var headerView: UIView!
        @IBOutlet weak var inputViewCard: UIView!
        @IBOutlet weak var outputViewCard: UIView!
        @IBOutlet weak var searchButton: UIButton!
        @IBOutlet weak var themeSwitch: UISwitch!
        

        // This Function contains the settings to change the app to a dark theme
        func dayTimeThemeIsSelected(){
            
            rootView.backgroundColor = UIColor.white
            headerView.backgroundColor = UIColor.white
            titleLabel.textColor = UIColor.black
            inputViewCard.backgroundColor = UIColor.white
            searchBar.textColor = UIColor.black
            outputViewCard.backgroundColor = UIColor.white
            categoryLabel.textColor = UIColor.black
            textView.textColor = UIColor.black
            textView.backgroundColor = UIColor.white
            searchButton.setTitleColor(UIColor.white, for: .normal)
            searchButton.backgroundColor = UIColor.black
            themeSwitch.setOn(false, animated: false)
        }
        
        //This Function contains the settings to change the app to a light theme
        func nightTimeThemeIsSelected(){
            
            rootView.backgroundColor = UIColor.black
            headerView.backgroundColor = UIColor.black
            titleLabel.textColor = UIColor.white
            inputViewCard.backgroundColor = UIColor.black
            searchBar.textColor = UIColor.black
            outputViewCard.backgroundColor = UIColor.black
            categoryLabel.textColor = UIColor.white
            textView.backgroundColor = UIColor.black
            textView.textColor = UIColor.white
            searchButton.setTitleColor(UIColor.black, for: .normal)
            searchButton.backgroundColor = UIColor.white
            themeSwitch.setOn(true, animated: false)
        }
        
        // This Function looks up the word and updates the User Interface
        @IBAction func searchButtonIsTaped(_ sender: Any) {
            guard let word = searchBar.text?.removeWhiteSpace() else {return}
            let networkRequest = NetworkService()
            
            networkRequest.makeAPIRequest(word) { (Term) in
                DispatchQueue.main.async {
                    guard let definition = Term.definition, let category = Term.category else {return}
                    self.textView.text = definition
                    self.categoryLabel.text = category
                }
            }
        }
        
        // This function applies the settings to switch the app theme through a Switch
        @IBAction func themeSwitchToggled(_ sender: Any) {
            
            let defaultPreferences = UserDefaults.standard
            let themeSwitch = sender as! UISwitch
            
            if themeSwitch.isOn{
                
                nightTimeThemeIsSelected()
                defaultPreferences.set(true, forKey: "midnightThemeOn")
                defaultPreferences.synchronize()
                
            }else{
                
               dayTimeThemeIsSelected()
               defaultPreferences.set(false, forKey: "midnightThemeOn")
               defaultPreferences.synchronize()
            }
        }
        
  
        override func viewDidLoad() {
                // SETTING UP SEACH BUTTON
            searchButton.layer.cornerRadius = 30
            searchButton.clipsToBounds = true
            searchButton.layer.masksToBounds = false
            searchButton.layer.shadowRadius = 1
            
            super.viewDidLoad()
            self.searchBar.delegate = self as UITextFieldDelegate
            
            // SETTINGS TO PERSIST NIGHT TIME/DAY TIME THEME MODE
            let defaultSettings = UserDefaults.standard
            if let isMidnightThemOn: Bool = defaultSettings.value(forKey: "midnightThemeOn") as! Bool? {
                if isMidnightThemOn{
                    
                    nightTimeThemeIsSelected()
                    themeSwitch.isOn = true
                    
                }else{
                    dayTimeThemeIsSelected()
                    themeSwitch.isOn = false
                }
            }else{
                dayTimeThemeIsSelected()
                themeSwitch.isOn = false
                defaultSettings.set(false, forKey: "midnightThemeOn")
                defaultSettings.synchronize()
            }
        }

    }
