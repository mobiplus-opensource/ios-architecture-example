//
//  GitPullRequestCommitsData.swift
//  DataLayer
//
//  Created by Lucas Silveira on 23/04/20.
//  Copyright © 2020 Taverna Apps. All rights reserved.
//

import Foundation

public struct GitPullRequestCommitsDTO: Codable {
    public var sha = ""
    public var commit = GitCommitDTO()
}
