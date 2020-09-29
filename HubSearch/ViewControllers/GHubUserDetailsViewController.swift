//
//  GHubUserDetailsViewController.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class GHubUserDetailsViewController: UIViewController {

     @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!

    var userViewModel = UserViewModel.init()
    
    var searchScreenDelegate: DetailsRelayProtocol?
     var userURL: String?
    var avatarURL: String?
             
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vModelConfiguration()
    }

    func loadProfileAvatar(avatarURL: String) {
        self.avatarImageView.imageryPull(picURL: avatarURL)
    }
}

extension GHubUserDetailsViewController {
    
    func vModelConfiguration() {
        guard let userURL = userURL else { return }
        userViewModel.fetchingDataIntoVM(stringURL: userURL)

        guard let avatarURL = avatarURL else { return }
        
        DispatchQueue.main.async {
            self.userViewModel.closureUponCompletion = {
                self.avatarImageView.imageryPull(picURL: avatarURL)
                self.usernameLabel.text = self.userViewModel.userModel?.name
            }
        }
    }
}


// extension GHubUserDetailsViewController: DetailsRelayProtocol {
//    func loadProfileAvatar(avatarURL: String) {
//        avatarImageView.imageryPull(picURL: avatarURL)
//    }
// }

//protocol DetailsRelayProtocol {
//    func loadProfileAvatar(imageURL: String)
//}

//    navigationController?.navigationBar.isHidden = true
        
//    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
//        self.avatarImageView.imageryPull(picURL: GloballyApplicableClass.mutableAvatarURL)
//    }
            

