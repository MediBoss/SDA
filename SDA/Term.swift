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
    

    enum mainEntryKey: String, CodingKey{
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
    enum definitions: String, CodingKey{
        case definitions
    }
    enum mainKeys: String, CodingKey{
        case definition
        case lexicalCategory
    }
    
    init(from decoder: Decoder) throws {
        let mainEntryPoint = try decoder.container(keyedBy: mainEntryKey.self)
        let lexicalEntryPoint = try mainEntryPoint.nestedContainer(keyedBy: lexicalEntryPoint.self, forKey: .results)
        let entriesEntryPoint = try lexicalEntryPoint.nestedContainer(keydBy: entriesKey.self, forKey: .entries)
        let sensesEntryPoint = try entriesEntryPoint.nestedConatiner(keyedBy: sensesKey.self, forKey: .senses)
        let definitionEntryPoint = try sensesEntryPoint.nestedContainer(keyedBy: definitions.self. forKey: .definitions)
        
        self.definition = try definitionEntryPoint.decode(String.self, forKey: .definition)
        //self.lexicalCategory = try 
    }
}
