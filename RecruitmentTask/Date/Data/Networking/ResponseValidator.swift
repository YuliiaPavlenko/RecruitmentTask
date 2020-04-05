//
//  ResponseValidator.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

func validateApiResponse(response: URLResponse?, error: Error?) -> VCError? {
    var errorInfo = ErrorInfo()
    
    if let er = error {
        errorInfo.message = er.localizedDescription
        return VCError.communicationError(errorInfo: errorInfo)
    }

    //TODO finish this
//    let httpResponse = response as? HTTPURLResponse {
//        guard let
//    }
//
//    guard let httpCode =  {
////        errorInfo.errorDescription = response.error?.localizedDescription
//        return (nil, VCError.unknown(errorInfo: errorInfo))
//    }
//
//    if 200 == httpCode {
//        return nil
//    }
    
//    errorInfo.httpCode = httpCode
//    if let json = try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
//        errorInfo.errorCode = json["errorCode"] as? String
//        errorInfo.errorDescription = json["errorDescription"] as? String
//        errorInfo.message = json["message"] as? String
//    }
//
//    return VCError.get(errorInfo: errorInfo)
    
//    do {
//        let json = try JSONDecoder().decode(T.self, from: data! )
//
//        print(json)
//        return (json, nil)
//
//    } catch {
//        print("Error during JSON serialization: \(error.localizedDescription)")
//        errorInfo.message = "Error during JSON serialization: \(error.localizedDescription)"
//
//        return (nil, VCError.parsingResponseError(errorInfo: errorInfo))
//    }
    
    
    return nil
}
