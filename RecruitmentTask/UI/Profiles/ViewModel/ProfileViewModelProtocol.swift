//
//  ProfileViewModelProtocol.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 23/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

import Foundation

protocol ProfileViewModelProtocol {
    var homeTeam: String { get }
    var awayTeam: String { get }
    
    
    func togglePause()
    
//    var homePlayers: [PlayerScoreboardMoveEditorViewModel] { get }
//    var awayPlayers: [PlayerScoreboardMoveEditorViewModel] { get }
}
