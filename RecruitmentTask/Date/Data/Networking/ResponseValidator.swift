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

    if let httpResponse = response as? HTTPURLResponse {
        if httpResponse.statusCode != 200 {
            errorInfo.httpCode = httpResponse.statusCode
            return VCError.get(errorInfo: errorInfo)
        }
    }
    
    return nil
}
