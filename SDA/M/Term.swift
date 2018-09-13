//
//  Term.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation


struct TermDescription: Decodable{
    let results: [Term]
}
struct Term: Decodable{
    var definition: String
    var partOfSpeech: String
}
