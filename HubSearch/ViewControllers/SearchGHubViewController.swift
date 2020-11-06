//
//  SearchGHubViewController.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

// @available(iOS 14.0, *)
class SearchGHubViewController: UIViewController, UISearchResultsUpdating {
    
    var searchScreenDelegate: DetailsRelayProtocol?
    
    var ghbViewModel = GHubViewModel.init()
    
    @IBOutlet weak var gHubSearchBar: UISearchBar!
    @IBOutlet weak var gHubUsersDisplayTable: UITableView!
    
    let gitButto: UIButton = {
        let butto = UIButton.init()
        butto.setTitle("Press Here", for: .normal)
        butto.setTitleColor(.black, for: .normal)
        butto.layer.cornerRadius = 10
        butto.backgroundColor = .white  // .lightGray
        butto.titleLabel?.font = UIFont(name: "Georgia", size: 17)
        return butto
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gHubUsersDisplayTable.isHidden = true
        tableViewSetUp()
        viewModelConfiguration()
        gHubSearchBar.delegate = self
        gitButtoSetup()
    }
    
    func tableViewSetUp() {
        gHubUsersDisplayTable.delegate = self
        gHubUsersDisplayTable.dataSource = self
    }
    
    func viewModelConfiguration() {
        ghbViewModel.gettingDataForVM(stringURL: GloballyApplied.ghubEntriesLink)
        
        DispatchQueue.main.async {
            self.ghbViewModel.closureUponCompletion = {
                self.gHubUsersDisplayTable.reloadData()
            }
        }
    }
}

extension SearchGHubViewController {
    
    func uiSearchControllerSetUp() {
        let searchControl = UISearchController(searchResultsController: nil)
        searchControl.obscuresBackgroundDuringPresentation = false
        searchControl.searchBar.placeholder = GloballyApplied.searchBarPlaceholder
        searchControl.searchResultsUpdater = self
        navigationItem.searchController = searchControl
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchCriteria = searchController.searchBar.text, searchCriteria.count > 0 {
            //            smViewModel.filteredFriendsData = smViewModel.friendsData.filter {
            //                $0.name.contains(searchCriteria) ||
            //                $0.address.contains(searchCriteria) ||
            //                $0.company.contains(searchCriteria)
            //            }
        } else {
            //  smViewModel.filteredFriendsData = smViewModel.friendsData
        }
        gHubUsersDisplayTable.reloadData()
    }
}

protocol DetailsRelayProtocol {
    func loadProfileAvatar(avatarURL: String)
}
