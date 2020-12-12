//
//  PostViewModel.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 05.12.2020.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class PostViewModel {
    private weak var dataProvider: DataProvider!
    private weak var coordinator: RootCoordinator?
    private var postInfo: PostFullInfo
    
    var author: Observable<User> {
        postInfo.author
    }
    var post: Driver<Post> {
        postInfo.post
    }
    var commentsSequence: Observable<[Comment]> {
        postInfo.comments
    }
    
    init(coordinator: RootCoordinator, dataProvider: DataProvider, post: PostFullInfo) {
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        self.postInfo = post
    }
}
