//
//  String+Extension.swift
//  SDA
//
//  Created by Medi Assumani on 9/5/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

extension String{
    // MARK: Function to remove whitespace from a string
    func removeWhiteSpace() -> String{
        return self.replacingOccurrences(of: " ", with: "")
    }
}
