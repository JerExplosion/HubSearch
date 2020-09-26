//
//  GloballyApplied.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

typealias TableViewDelegateDatasourceCombined = UITableViewDelegate & UITableViewDataSource

struct GloballyApplied {
    static let gHubUserCellID = "gHubUserCell"
    static let ghubEntriesLink = "https://api.publicapis.org/entries"
    static let searchBarPlaceholder = "Search Github Users"
    static let perfectoRowHeight = 57
}

let newKinURL = "https://api.github.com/search/users?q=a&page2&per_page=36"
// per_page can be changed, page2 also can
      
