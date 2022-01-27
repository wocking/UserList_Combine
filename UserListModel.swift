//
//  UserListModel.swift
//  Login_MVVM
//
//  Created by Heng.Wang on 2022/1/27.
//

import Foundation

import Foundation

struct UserListModel: Codable {
    let results: [UserProfile]?
}

struct UserProfile: Codable {
    let gender: String?
    let name: Name?
    let email: String?
    let dob: Dob?
    let picture: Picture?
}

struct Dob: Codable {
    let date: String?
    let age: Int?
}

struct Name: Codable {
    let title: String?
    let first: String?
    let last: String?
}

struct Picture: Codable {
    let large: String?
    let medium: String?
    let thumbnail: String?
}
