//
//  GHubUserDetailsViewController.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class GHubUserDetailsViewController: UIViewController, DetailsRelayProtocol {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    var searchScreenDelegate: DetailsRelayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.isHidden = true
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
//            self.avatarImageView.imageryPull(picURL: GloballyApplicableClass.mutableAvatarURL)
//        }
    }
    
    func loadProfileAvatar(avatarURL: String) {
        self.avatarImageView.imageryPull(picURL: avatarURL)
        print("details relay url is: ", avatarURL)
    }
}
// searchViewController.searchdelegate = self blabla

extension GHubUserDetailsViewController {
//    func loadProfileAvatar(avatarURL: String) {
//        avatarImageView.imageryPull(picURL: avatarURL)
//    }
}

//protocol detailsRelayProtocol {
//    func loadProfileAvatar(imageURL: String)
//}

