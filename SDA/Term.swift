//
//  Term.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

struct Term: Decodable{
    
    let definition: String? // first definition of the term
    let lexicalCategory: String? // verb, noun, pronoun, etc...
    

    enum resultsKey: String, CodingKey{
        case results
    }
    enum lexicalEntriesKey: String, CodingKey{
        case lexicalEntries
    }
    enum entriesKey: String, CodingKey{
        case entries
    }
    enum sensesKey: String, CodingKey{
        case senses
    }
    enum definitionsKey: String, CodingKey{
        case definitions
    }
    enum lexicalCategoryKey: String, CodingKey{
        case lexicalCategory
    }
    enum mainKeys: String, CodingKey{
        case definition
        case category
    }
    
    init(from decoder: Decoder) throws {
        
                // Decoding each needed layer of the JSON file returned
        let resultsEntryPoint = try decoder.container(keyedBy: resultsKey.self)
        let lexicalEntryPoint = try resultsEntryPoint.nestedContainer(keyedBy: lexicalEntriesKey.self, forKey: .results)
        let entriesKeyEntryPoint = try lexicalEntryPoint.nestedContainer(keyedBy: entriesKey.self, forKey: .lexicalEntries)
        let sensesEntryPoint = try entriesKeyEntryPoint.nestedContainer(keyedBy: sensesKey.self, forKey: .entries)
        let definitionsEntryPoint = try sensesEntryPoint.nestedContainer(keyedBy: definitionsKey.self, forKey: .senses)
        let categoryEntryPoint = try lexicalEntryPoint.nestedContainer(keyedBy: lexicalCategoryKey.self, forKey: .lexicalEntries)
        
        //Initializing the class variables
        self.definition = try definitionsEntryPoint.decode(String.self, forKey: .definitions)
        self.lexicalCategory = try categoryEntryPoint.decode(String.self, forKey: .lexicalCategory)
        
    }
}
