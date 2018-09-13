//
//  NetworkService.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

struct NetworkService{
    
    // var singleton = NetworkService()
    
    // MARK: Function to make the request to the Oxford API
     func makeAPIRequest(_ word: String,_ completionHandler: @escaping (Term) ->Void){
        
        // MARK: Setting up the request headers to be made to the api
        let url = URL(string: "\(Constants.baseURL)/\(Constants.source_lang)/\(word)")
        guard let unwrapedURL = url else {return}
        var request: URLRequest = URLRequest(url: unwrapedURL)
        request.addValue("\(Constants.httpAcceptHeader)", forHTTPHeaderField: "Accept")
        request.addValue("\(Constants.app_id)", forHTTPHeaderField: "app_id")
        request.addValue("\(Constants.apiKey)", forHTTPHeaderField: "app_key")
        
        // MARK: Launching the GET request to the API
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil{
                
                guard let httpResponse = response as? HTTPURLResponse else {return}
                
                // MARK: evaluating the JSON response from the API
                switch httpResponse.statusCode{
                case 200:
                    do{
                        
                        guard let dataFromApi = data else {return}
                        // MARK: Decoding the data recievd from the server into a Term object
                        let decoder = JSONDecoder()
                        let term = try decoder.decode(Term.self, from: dataFromApi)
                        completionHandler(term)
                        
                    }catch let errorFromDataReceived{
                        //MARK: Checking for possible errors
                        print(errorFromDataReceived.localizedDescription)
                    }
                default:
                    print("HTTP CODE : \(httpResponse.statusCode)")
                }
            }else{
                guard let errorFound = error else {return}
                print(errorFound.localizedDescription)
            }
        }
        task.resume()
    }
}
