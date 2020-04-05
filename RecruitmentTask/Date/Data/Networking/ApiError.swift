//
//  ApiError.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

enum VCError: Error {
    case unauthorised(errorInfo: ErrorInfo?)
    case forbidden(errorInfo: ErrorInfo?)
    case badRequest(errorInfo: ErrorInfo?)
    case serverError(errorInfo: ErrorInfo?)
    case unknown(errorInfo: ErrorInfo?)
    case communicationError(errorInfo: ErrorInfo?)
    case parsingResponseError(errorInfo: ErrorInfo?)

    static func get(errorInfo: ErrorInfo?) -> VCError {
        guard let code = errorInfo?.httpCode else {
            return unknown(errorInfo: errorInfo)
        }

        if 401 == code {
            return unauthorised(errorInfo: errorInfo)
        } else if 403 == code {
            return forbidden(errorInfo: errorInfo)
        } else if 400 == code {
            return badRequest(errorInfo: errorInfo)
        } else if [404, 406, 429, 500].contains(code) {
            return serverError(errorInfo: errorInfo)
        } else {
            return unknown(errorInfo: errorInfo)
        }
    }

    var debugDescription: String {
        return self.debugInfo ?? "No debug info"
    }

    private var debugInfo: String? {
        switch self {
        case .unauthorised(let errorInfo),
             .forbidden(let errorInfo),
             .badRequest(let errorInfo),
             .serverError(let errorInfo),
             .unknown(let errorInfo),
             .communicationError(let errorInfo),
        .parsingResponseError(let errorInfo):
            
            return "ErrorInfo: \(String(describing: errorInfo?.debugInfo))"
        }
    }
}
