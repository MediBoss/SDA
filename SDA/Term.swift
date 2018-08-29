//
//  Term.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

struct Term: Decodable{
    
    let definition: String?
    let lexicalCategory: String?
    
    
    
    init(from decoder: Decoder) throws {
        
    }
}
