//
//  SearchBarSettings.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

extension SearchGHubViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var entriesToBeFiltered = ghbViewModel.filteredHubModel?.entries
        
        ghbViewModel.filteredHubEntries = entriesToBeFiltered?.filter {
            ($0.API?.contains(searchText) ?? true)
            // || ($0.Description?.contains(searchText) ?? true)
        }
        print(ghbViewModel.filteredHubEntries?.count)
        gHubUsersDisplayTable.isHidden = false
        gHubUsersDisplayTable.reloadData()
    }
}
