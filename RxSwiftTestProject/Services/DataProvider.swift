//
//  DataProvider.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 05.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

class DataProvider {
    let postsSequence: Observable<[Post]>
    private let usersSequence: Observable<[User]>
    private let commentsSequence: Observable<[Comment]>
    
    init() {
        self.postsSequence = DataLoader.loadPosts()
        self.usersSequence = DataLoader.loadUsers()
        self.commentsSequence = DataLoader.loadComments()
    }
    
    func postData(post: Post) -> PostFullInfo {
        let user = usersSequence.compactMap({ items -> User? in
            var result: User?
            items.forEach {
                if $0.id == post.id {
                    result = $0
                    return
                }
            }
            return result
        })
        let comments = commentsSequence.map { return $0.filter { $0.postId == post.id } }
        
        return PostFullInfo(post: Driver.just(post),
                            author: user,
                            comments: comments)
    }
}
