//
//  PostsViewModel.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 04.12.2020.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ListOfPostsViewModel {
    weak var dataProvider: DataProvider!
    private weak var coordinator: RootCoordinator?
    
    var postsSequence: Observable<[Post]> {
        dataProvider.postsSequence
    }
    
    init(coordinator: RootCoordinator, dataProvider: DataProvider) {
        self.coordinator = coordinator
        self.dataProvider = dataProvider
    }
    
    func didTapCell(with element: Post) {
        coordinator?.togglePost(post: element)
    }
}
