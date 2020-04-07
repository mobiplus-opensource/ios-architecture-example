//
//  PullRequestDetailsViewModel.swift
//  Presentation
//
//  Created by Victor C Tavernari on 05/04/20.
//  Copyright (c) 2020 Taverna Apps. All rights reserved.
//
//  This file was generated by Mobiplus Clean
//

import Domain

class PullRequestDetailsViewModel: PullRequestDetailsViewModelInterface {
    var route = Observable<PullRequestDetailsViewModelRoute>(.none)
    var isLoading = Observable<Bool>(false)
    var failMessage = Observable<String?>(nil)
    var pullRequest = Observable<GitPullRequest?>(nil)

    private let useCase: FetchPullRequestDetailUseCaseInterface

    init(useCase: FetchPullRequestDetailUseCaseInterface) {
        self.useCase = useCase
    }

    func load(pullRequestid: Int, fromRepo repo: GitRepository) {
        useCase.execute(id: pullRequestid, fromRepo: repo)
    }
}

extension PullRequestDetailsViewModel: FetchPullRequestDetailInterfaceAdapter {
    func doing() {
        isLoading.value = true
    }

    func done(data: GitPullRequest) {
        pullRequest.value = data
        isLoading.value = false
    }

    func failure(error: Error) {
        failMessage.value = error.localizedDescription
        isLoading.value = false
    }
}
