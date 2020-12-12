//
//  RootCoordinator.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 04.12.2020.
//

import Foundation
import UIKit

class RootCoordinator: NSObject, Coordinator {
    weak var parent: Coordinator?
    var rootNavigationController: UINavigationController?
    var homeViewController: ListOfPostsViewController
    
    var dataProvider: DataProvider
    
    var rootViewController: UIViewController? {
        return rootNavigationController
    }
    
    override init() {
        dataProvider = DataProvider()
        homeViewController = ListOfPostsViewController.instantiate()
        super.init()        
    }
    
    func start() {
        let homeViewModel = ListOfPostsViewModel(coordinator: self, dataProvider: dataProvider)
        homeViewController.viewModel = homeViewModel
        rootNavigationController = UINavigationController(rootViewController: homeViewController)
    }
    
    func togglePost(post: Post) {
        let postViewController = PostViewController.instantiate()
        let postViewModel = PostViewModel(coordinator: self,
                                          dataProvider: dataProvider,
                                          post: dataProvider.postData(post: post))
        postViewController.viewModel = postViewModel
        rootNavigationController?.pushViewController(postViewController, animated: true)
    }
}
