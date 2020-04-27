//
//  NetworkManager.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

final class NetworkManager {

    static let shared = NetworkManager()
    let session: URLSession

    private init() {
        session = URLSession(configuration: .default)
    }
    
    private func getData<Data: Decodable>(url: URL, completion: @escaping ((Data?, RTError?) -> Void)) {
        let task = session.dataTask(with: url, completionHandler: { data, response, error in

            if let error = validateApiResponse(response: response, error: error) {
                completion(nil, error)
                return
            }

            do {
                let json = try JSONDecoder().decode(Data.self, from: data!)

                completion(json, nil)
            } catch {
                var errorInfo = ErrorInfo()
                errorInfo.message = "Error during JSON serialization: \(error.localizedDescription)"

                completion(nil, RTError.parsingResponseError(errorInfo: errorInfo))
            }

        })
        task.resume()
    }

    func getUsers(completion: @escaping (([User]?, RTError?) -> Void)) {
        let url = URL(string: Router.users)!
        getData(url: url, completion: completion)
    }

    func getPostsForUser(userId: Int, completion: @escaping (([Post]?, RTError?) -> Void)) {
        let url = URL(string: Router.postsForUser(userId))!
        getData(url: url, completion: completion)
    }
}
