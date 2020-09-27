//
//  UpdatedHubModel.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct UpdatedHubModel: Codable {
    let total_Count: Int?
    let incomplet_results: Bool?
    let items: [UpdatedHubItems]
}
  
struct UpdatedHubItems: Codable {
    let loginName: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case loginName = "login"
        case avatarURL = "avatar_url"
    }
}
