//
//  GHubUserDetailsViewController.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class GHubUserDetailsViewController: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
}

protocol relayProtocol {
    
}
