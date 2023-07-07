//
//  UserModel.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-29.
//

import Foundation

struct User: Identifiable, Codable,Equatable {
    let id: Int
    let username: String
    let type: String
    let avatarURL: String
    let followersURL: String
    let reposURL: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case avatarURL = "avatar_url"
        case followersURL = "followers_url"
        case reposURL = "repos_url"
        case id
        case type
        case url
    }
}
