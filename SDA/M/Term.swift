//
//  Term.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation


struct Term: Decodable{
    
    var definition: String?
    var category: String?
    
    enum ResultsKey: String, CodingKey{
      case results
      enum CodingKeys: String, CodingKey{
            case definition
            case partOfSpeech
        }
    }
    
    init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: ResultsKey.self)
        let resultKey = try container.nestedUnkeyedContainer(forKey: .results)
        
        
        
    }
    
}
