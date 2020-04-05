//
//  NetworkManager.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let session:URLSession
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func getPosts(completion: @escaping (([Post]?, VCError?) -> Void)) {
        let url = URL(string: Router.posts)!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            
            if let err = validateApiResponse(response: response, error: error){
                completion(nil, err)
            }
            
//        // Check if an error occured
//        if error != nil {
////            completion(nil, VCError.)
//            return
//        }
            
            do {
                let json = try JSONDecoder().decode([Post].self, from: data! )
                
                print(json)
                completion(json, nil)
                
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
                var errorInfo = ErrorInfo()
                errorInfo.message = "Error during JSON serialization: \(error.localizedDescription)"
                 
                completion (nil, VCError.parsingResponseError(errorInfo: errorInfo))
            }
        
//        // Serialize the data into an object
//        do {
//            let json = try JSONDecoder().decode([Post].self, from: data! )
//                //try JSONSerialization.jsonObject(with: data!, options: [])
//            print(json)
//        } catch {
//            print("Error during JSON serialization: \(error.localizedDescription)")
//        }
        })
        task.resume()
    }
    
    
}
