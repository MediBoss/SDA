//
//  NetworkService.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

struct NetworkService{
    var word_id : String
    var completeURL: URL
    
    init(word_id: String) {
        self.word_id = word_id
        self.completeURL = URL(string: "\(Constants.baseURL)"+"/"+"\(Constants.source_lang)" + "\(self.word_id)")!
        
    }
    
    func makeAPIRequest(_ completionHandler: @escaping (Term) ->Void){
        
        let request: URLRequest = URLRequest(url: self.completeURL)
        let task = URLSession.shared.dataTask(with: request) { (dataFromApi, response, error) in
            if error == nil{ // if there is no error during the api call
                guard let httpResponse = response as? HTTPURLResponse else {return}
                    // checking to see the response code from the api
                switch httpResponse.statusCode{
                case 200:
                    
                case 400:
                    
                default:
                    
                }
                
                
            }
        }
    }
}
