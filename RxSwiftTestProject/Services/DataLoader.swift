//
//  PostsDataProvider.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 04.12.2020.
//

import Foundation
import RxSwift
class DataLoader {
    static func loadPosts() -> Observable<[Post]> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return Observable.just([]) }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return URLSession.shared
            .rx.data(request: request)
            .retry()
            .map {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: $0)
                    return posts
                } catch {
                    return []
                }
            }
    }
    
    static func loadUsers() -> Observable<[User]> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return Observable.just([]) }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return URLSession.shared
            .rx.data(request: request)
            .retry()
            .map {
                do {
                    let users = try JSONDecoder().decode([User].self, from: $0)
                    return users
                } catch {
                    return []
                }
            }
    }
    
    static func loadComments() -> Observable<[Comment]> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else { return Observable.just([]) }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
            
        return URLSession.shared
            .rx.data(request: request)
            .retry()
            .map {
                do {
                    let comments = try JSONDecoder().decode([Comment].self, from: $0)
                    return comments
                } catch {
                    return []
                }
            }
    }
}

