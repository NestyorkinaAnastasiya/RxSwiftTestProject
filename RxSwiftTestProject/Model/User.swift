//
//  User.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 04.12.2020.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}
