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
    var partOfSpeech: String?
    
//    enum ExternalCodingKeys: String, CodingKey{
//        case results = "results"
//        enum InternalCodingKeys: String, CodingKey{
//            case definition = "definition"
//            case partOfSpeech = "partOfSpeech"
//        }
//    }
//
//    init(from decoder: Decoder) throws{
//        let outerContainer = try decoder.container(keyedBy: ExternalCodingKeys.self)
//        var innerContainer = try outerContainer.nestedUnkeyedContainer(forKey: .results)
//        let thirdContainer = try innerContainer.nestedContainer(keyedBy: ExternalCodingKeys.InternalCodingKeys.self)
//
 //   }
}

struct Terms: Decodable{
    var results: [Term]
}





