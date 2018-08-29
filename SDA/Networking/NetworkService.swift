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
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil{ // if there is no error during the api call
                guard let httpResponse = response as? HTTPURLResponse else {return}
                    // checking to see the response code from the api
                switch httpResponse.statusCode{
                case 200:
                    guard let dataFromApi = data else {return}
                    do{
                            // Decoding the data from the API from JSON format to Term Object
                        let decoder = JSONDecoder()
                        let term = try decoder.decode(Term.self, from: dataFromApi)
                        completionHandler(term)
                        
                    }catch let errorFromDataReceived{
                            // if an error is found while decoding the JSON data
                        print(errorFromDataReceived.localizedDescription)
                    }
                    
                default:
                        // if a code other than 200 is returned
                    print("HTTP CODE : \(httpResponse.statusCode)")
                    
                }
                
            }else{
                    // if an error was found during the http request
                guard let errorFound = error else {return}
                print(errorFound.localizedDescription)
            }
        }.resume()
    }
}
