//
//  GitButtoExtension.swift
//  HubSearch
//
//  Created by Jerry Ren on 11/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

extension SearchGHubViewController {
          
    func gitButtoSetup() {
        view.addSubview(gitButto)
        gitButto.addTarget(self, action: #selector(buttoTapped), for: .touchUpInside)
  //      gitButto.frame = CGRect(x: 0, y: 0, width: 160, height: 50)
   //     gitButto.center = view.center
        gitButto.translatesAutoresizingMaskIntoConstraints = false
        gitButto.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        gitButto.widthAnchor.constraint(equalToConstant: 160).isActive = true
        gitButto.heightAnchor.constraint(equalToConstant: 50).isActive = true
        gitButto.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -105).isActive = true
    }
     
    @objc private func buttoTapped() {
        guard let url = URL(string: "https://www.github.com") else { return }
        let destinationWebCon = ComputedWebKitViewController.init(url: url, titleString: "Github Website")
        let navigationConWrapper = UINavigationController(rootViewController: destinationWebCon)
        present(navigationConWrapper, animated: true, completion: nil)
    }
}
