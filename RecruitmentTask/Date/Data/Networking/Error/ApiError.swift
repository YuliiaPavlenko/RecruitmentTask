//
//  ApiError.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

enum RTError: Error {
    case serverError(errorInfo: ErrorInfo?)
    case unknown(errorInfo: ErrorInfo?)
    case communicationError(errorInfo: ErrorInfo?)
    case parsingResponseError(errorInfo: ErrorInfo?)

    static func get(errorInfo: ErrorInfo?) -> RTError {
        guard let code = errorInfo?.httpCode else {
            return unknown(errorInfo: errorInfo)
        }

        if [404, 406, 429, 500].contains(code) {
            return serverError(errorInfo: errorInfo)
        } else {
            return unknown(errorInfo: errorInfo)
        }
    }

    var debugDescription: String {
        return debugInfo ?? "No debug info"
    }

    private var debugInfo: String? {
        switch self {
        case .serverError(let errorInfo),
             .unknown(let errorInfo),
             .communicationError(let errorInfo),
             .parsingResponseError(let errorInfo):

            return "ErrorInfo: \(String(describing: errorInfo?.debugInfo))"
        }
    }
}
