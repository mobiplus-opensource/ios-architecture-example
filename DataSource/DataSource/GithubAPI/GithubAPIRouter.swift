//
//  GithubAPIRouter.swift
//  DataSource
//
//  Created by Victor C Tavernari on 06/03/20.
//  Copyright © 2020 Taverna Apps. All rights reserved.
//

import Alamofire

enum GithubAPIRouter: URLRequestConvertible {
    case search(term: String)
    case listPullRequest(owner: String, repoName: String)

    struct ProductionServer {
        static let baseURL = "https://api.github.com"
    }

    private var path: String {
        switch self {
            case .search(let term):
                return "/search/repositories?q=\(term)"
            case .listPullRequest(let owner, let repoName):
                return "/repos/\(owner)/\(repoName)/pulls"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try! "\(GithubAPIRouter.ProductionServer.baseURL)\(path)".asURL()
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
}