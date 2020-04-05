//
//  DisplayError.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 05/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

struct DisplayErrorModel {
    var title: String
    var message: String
}

enum DisplayError {
    case usersList, posts

    func displayMessage(rtError: RTError) -> DisplayErrorModel {
        switch self {
        case .usersList:
            return getErrorMessageForUserLists(rtError: rtError)
        case .posts:
            return getErrorMessageGetPosts(rtError: rtError)
        }
    }

    private func getErrorMessageForUserLists(rtError: RTError) -> DisplayErrorModel {
        let errorDescription = "Error get users list"
        var message: String?
        switch rtError {
        case .serverError, .unknown, .communicationError:
            message = "Failed to get users. Please make sure you\'re connected to the internet and try again.\nContact support if the problem continues."
        default:
            message = "Unknown error"
        }
        #if DEBUG
        message = rtError.debugDescription
        #endif
        return DisplayErrorModel(title: errorDescription, message: message!)
    }

    private func getErrorMessageGetPosts(rtError: RTError) -> DisplayErrorModel {
        let errorDescription = "Error get posts"
        var message: String?
        switch rtError {
        case .serverError, .unknown, .communicationError:
            message = "Failed to get posts. Please make sure you\'re connected to the internet and try again.\nContact support if the problem continues."
        default:
            message = "Unknown error"
        }
        #if DEBUG
        message = rtError.debugDescription
        #endif
        return DisplayErrorModel(title: errorDescription, message: message!)
    }
}
