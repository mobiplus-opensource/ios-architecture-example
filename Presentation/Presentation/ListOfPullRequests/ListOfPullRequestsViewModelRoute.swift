//
//  ListOfPullRequestsViewModelRoute.swift
//  Presentation
//
//  Created by Victor C Tavernari on 04/04/20.
//  Copyright (c) 2020 Taverna Apps. All rights reserved.
//
//  This file was generated by Mobiplus Clean
//

import Domain

enum ListOfPullRequestsViewModelRoute: Equatable {
    case none
    case showPullRequestDetail(id: Int, repo: GitRepository)
}
