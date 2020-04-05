//
//  StartPresenter.swift
//  RecruitmentTask
//
//  Created by Yuliia Pavlenko on 04/04/2020.
//  Copyright © 2020 Yuliia Pavlenko. All rights reserved.
//

protocol StartViewDelegate: class {
    func showProfileVC()
}

class StartPresenter {
    weak var viewDelegate: StartViewDelegate?

    func screenClicked() {
        viewDelegate?.showProfileVC()
    }
}
