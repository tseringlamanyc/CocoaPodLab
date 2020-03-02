//
//  RandomUser.swift
//  CocoaPodLab
//
//  Created by Tsering Lama on 3/1/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation

struct RandomUser: Codable {
    let results: [Result1]
}

struct Result1: Codable {
    let email: String
    let name: Name
    let dob: Dob
    let location: Location
}

struct Name: Codable {
    let title, first, last: String
}

struct Dob: Codable {
    let date: String
    let age: Int
}

struct Location: Codable {
    let street: Street
    let city, state, country: String
}

struct Street: Codable {
    let number: Int
    let name: String
}


