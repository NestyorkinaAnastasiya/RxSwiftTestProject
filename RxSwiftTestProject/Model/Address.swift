//
//  Address.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 04.12.2020.
//

import Foundation

struct Geoposition: Codable {
    let lat: String
    let lng: String
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geoposition
}
