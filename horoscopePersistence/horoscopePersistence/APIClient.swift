//
//  APIClient.swift
//  horoscopePersistence
//
//  Created by Sam Roman on 9/24/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation


struct HoroscopeAPIClient {
    
    static let shared = HoroscopeAPIClient()
    
    
    
    func getHoroscopes(completionHandler: @escaping (Result<Horoscope,AppError>) -> () ) {
        
        guard let url = URL(string: "http://sandipbgt.com/theastrologer/api/horoscope/gemini/today") else {
            completionHandler(.failure(.badURL))
            return
        }
        
        NetworkManager.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(Horoscope.self, from: data)
                    completionHandler(.success(response))
                } catch {
                    completionHandler(.failure(.invalidJSONResponse))
                                       print(error)
                }
            }
        }
        
        
    }
    
    
}
