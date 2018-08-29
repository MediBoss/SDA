//
//  NetworkService.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

struct NetworkService{
    var word_id : String?
    var completeURL: URL?
    
    init(word_id: String) {
        self.word_id = word_id
        self.completeURL = URL(string: "")
    }
    
    func makeAPIRequest(_ completionHandler: @escaping (Term) ->Void){
        
    }
}
