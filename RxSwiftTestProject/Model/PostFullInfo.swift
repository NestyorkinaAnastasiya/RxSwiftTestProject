//
//  PostFullInfo.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 05.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

struct PostFullInfo {
    let post: Driver<Post>
    let author: Observable<User>
    let comments: Observable<[Comment]>
}
