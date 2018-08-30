//
//  Term.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation



struct Term: Decodable {
    
    var definition: String? // first definition of the term

    enum resultsKey: String, CodingKey{
        case results
        enum LexicalEntries: String, CodingKey{
            case entries, lexicalEntries
            enum lexicalCategory: String, CodingKey{
                case lexicalCategory
            }
            enum entriesKey: String, CodingKey{
                case entries
                enum sensesKey: String, CodingKey{
                    case senses
                    enum DefinitionsKey: String, CodingKey{
                        case definitions = "definitions"
                    }
                }
                
            }
        }
    }
    
    enum lexicalCategoryKey: String, CodingKey{
        case lexicalCategory
    }
    enum mainKeys: String, CodingKey{
        case definition = "definitions"
    }
    
    init(from decoder: Decoder) throws {
        
                // Decoding each needed layer of the JSON file returned
        let firstEntryPoint = try decoder.container(keyedBy: resultsKey.self)
        var secondEntryPoint = try firstEntryPoint.nestedUnkeyedContainer(forKey: .results)
        let thirdEntryPoint = try secondEntryPoint.nestedContainer(keyedBy: resultsKey.LexicalEntries.self)
        var fourthEntryPoint = try thirdEntryPoint.nestedUnkeyedContainer(forKey: .lexicalEntries)
        let fithEntryPoint = try fourthEntryPoint.nestedContainer(keyedBy: resultsKey.LexicalEntries.entriesKey.self)
        var sixthEntryPoint = try fithEntryPoint.nestedUnkeyedContainer(forKey: .entries)
        let seventhEntryPoint = try sixthEntryPoint.nestedContainer(keyedBy: resultsKey.LexicalEntries.entriesKey.sensesKey.self)
        var eithEntryPoint = try seventhEntryPoint.nestedUnkeyedContainer(forKey: .senses)
        let ninethEntryPoint = try eithEntryPoint.nestedContainer(keyedBy: resultsKey.LexicalEntries.entriesKey.sensesKey.DefinitionsKey.self)
        var tenthEntryPoint = try ninethEntryPoint.nestedUnkeyedContainer(forKey: .definitions)
        
        self.definition = try? tenthEntryPoint.decode(String.self)
        
    }
}
