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
        
        // - MARK : METHODS & IBACTIONS
        
        
        // This Function contains the settings to change the app to a dark theme
        func dayTimeThemeIsSelected(){
            
            self.rootView.backgroundColor = UIColor.white
            self.headerView.backgroundColor = UIColor.white
            self.titleLabel.textColor = UIColor.black
            self.inputViewCard.backgroundColor = UIColor.white
            self.searchBar.textColor = UIColor.black
            self.outputViewCard.backgroundColor = UIColor.white
            self.categoryLabel.textColor = UIColor.black
            self.textView.textColor = UIColor.black
                        self.textView.backgroundColor = UIColor.white
            //self.searchButton.currentTitleColor = UIColor.black
            self.searchButton.backgroundColor = UIColor.black
            themeSwitch.setOn(false, animated: false)
        }
        
        //This Function contains the settings to change the app to a light theme
        func nightTimeThemeIsSelected(){
            
            self.rootView.backgroundColor = UIColor.black
            self.headerView.backgroundColor = UIColor.black
            self.titleLabel.textColor = UIColor.white
            self.inputViewCard.backgroundColor = UIColor.black
            self.searchBar.textColor = UIColor.black
            self.outputViewCard.backgroundColor = UIColor.black
            self.categoryLabel.textColor = UIColor.white
            self.textView.backgroundColor = UIColor.black
            self.textView.textColor = UIColor.white
            //self.searchButton.currentTitleColor = UIColor.white
            self.searchButton.backgroundColor = UIColor.white
            themeSwitch.setOn(true, animated: false)
        }
        
        

        @IBAction func searchButtonIsTaped(_ sender: Any) {
            guard let word = self.searchBar.text?.removeWhiteSpace() else {return}
            let networkRequest = NetworkService()

            networkRequest.makeAPIRequest(word) { (Term) in
                DispatchQueue.main.async {
                    guard let definition = Term.definition, let category = Term.category else {return}
                    self.textView.text = definition
                    self.categoryLabel.text = category
                }
            }
        }
        
        // This function applies the settings to switch the theme through a Switch
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
            super.viewDidLoad()
            self.searchBar.delegate = self as UITextFieldDelegate
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
