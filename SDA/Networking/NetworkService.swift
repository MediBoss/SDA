//
//  NetworkService.swift
//  SDA
//
//  Created by Medi Assumani on 8/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

struct NetworkService{
    
    func makeAPIRequest(_ word: String,_ completionHandler: @escaping (Term) ->Void){
        
        let completeURL = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/\(word)")!
        var request: URLRequest = URLRequest(url: completeURL)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("\(Constants.app_id)", forHTTPHeaderField: "app_id")
        request.addValue("\(Constants.apiKey)", forHTTPHeaderField: "app_key")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil{ // if there is no error during the api call
                guard let httpResponse = response as? HTTPURLResponse else {return}
                    // checking to see the response code from the api
                switch httpResponse.statusCode{
                case 200:
                    guard let dataFromApi = data else {return}
                    print(dataFromApi)
                    do{
                        
                        let decoder = JSONDecoder()
                        let term = try decoder.decode(Term.self, from: dataFromApi)
                        print(term)
 
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
