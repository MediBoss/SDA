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
        
        var completeURL = URL(string: "\(Constants.baseURL)"+"/"+"\(Constants.source_lang)" + "/\(word)")!
        var request: URLRequest = URLRequest(url: completeURL)
        request.allHTTPHeaderFields = ["app_key":"e43c5c4fc39024d2394905f2308e807e",
                                       "Accept":"application/json",
                                       "app_id":Constants.app_id]
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil{ // if there is no error during the api call
                guard let httpResponse = response as? HTTPURLResponse else {return}
                    // checking to see the response code from the api
                switch httpResponse.statusCode{
                case 200:
                    guard let dataFromApi = data else {return}
                    print(dataFromApi)
                    do{
                            // Decoding the data from the API from JSON format to Term Object
                        //let decoder = JSONDecoder()
                        //let term = try decoder.decode(Term.self, from: dataFromApi)
                        //print(term)
                      
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
