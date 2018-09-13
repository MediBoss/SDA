//
//  NetworkService.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

struct NetworkService{
    
    // MARK: Function to make the request to the Oxford API
     func makeAPIRequest(_ word: String,_ completionHandler: @escaping (TermDescription) ->Void){
        
        // MARK: Setting up the request headers to be made to the api
        let url = URL(string: "https://wordsapiv1.p.mashape.com/words/\(word)")
        guard let unwrapedURL = url else {return}
        var request: URLRequest = URLRequest(url: unwrapedURL)
        request.addValue("\(Constants.api_key)", forHTTPHeaderField: "X-Mashape-Key")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // MARK: Launching the GET request to the API
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil{
                
                guard let httpResponse = response as? HTTPURLResponse, let dataFromApi = data else {return}
                
                switch httpResponse.statusCode{
                case 200:
                    do{
                        let term = try JSONDecoder().decode(TermDescription.self, from: dataFromApi)
                        print(term)
                        completionHandler(term)
                        
                    }catch let errorFromDataReceived{
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
