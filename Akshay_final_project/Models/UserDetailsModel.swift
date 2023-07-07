//
//  UserDetailsModel.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-12-06.
//

import Foundation

struct UserDetail: Codable {
    let username: String
    let id: Int
    let avatarUrl: String
    let url: String
    let type: String
    let name: String?
    let company: String?
    let location: String?
    let email: String?
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username = "login"
        case avatarUrl = "avatar_url"
        case url
        case type
        case name, company, location, email
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

}

