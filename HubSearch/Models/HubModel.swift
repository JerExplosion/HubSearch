//
//  HubModel.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct EntryModel: Codable {
    let API: String?
    let Description: String?
    let Link: String?
}

struct HubModel: Codable {
    let entries: [EntryModel]
}
        

