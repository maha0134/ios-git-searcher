//
//  UserResponseModel.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-30.
//

import Foundation

struct UserResponseModel: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let data: [User]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case data = "items"
    }
}
