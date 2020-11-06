//
//  ComputedWebKitViewController.swift
//  HubSearch
//
//  Created by Jerry Ren on 11/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import WebKit
import UIKit
     
class ComputedWebKitViewController: UIViewController {
    
    private let computedWebView: WKWebView = {
        
         let preferenceSettings = WKPreferences.init()
         preferenceSettings.javaScriptEnabled = true
        let configurationSettings = WKWebViewConfiguration.init()
         configurationSettings.preferences = preferenceSettings

        let webkitView = WKWebView(frame: .zero, configuration: configurationSettings)
        return webkitView
    }()
    
    private let wkUrl: URL
    
    init(url: URL, titleString: String) {
        self.wkUrl = url
        super.init(nibName: nil, bundle: nil)
        self.title = titleString
    }
    required init?(coder: NSCoder) {
        fatalError("why does there have to be a fatalError smh")
    }
              
    override func viewDidLoad() {
        super.viewDidLoad()
        print("called")
        view.backgroundColor = .systemBackground
        view.addSubview(computedWebView)
        computedWebView.load(URLRequest(url: wkUrl))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        computedWebView.frame = view.bounds
        settingUpNavBarButtos()
    }
    
    func settingUpNavBarButtos() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(donePresser))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresherPresser))
    }
    
    @objc func donePresser() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func refresherPresser() {
        computedWebView.load(URLRequest(url: wkUrl))
    }
}

// let preferenceSettings = WKPreferences.init() // deprecated in ios 14
// preferenceSettings.javaScriptEnabled = true // deprecated in ios 14
// configurationSettings.preferences = preferenceSettings //deprecated in ios 14

// _____________either above or below, both valid, one old one new ____________________

// @available(iOS 14.0, *)
// a chore though, cause anything having a reference to this class would have to add this line too
//        let preferenceSettings = WKWebpagePreferences.init()
//        preferenceSettings.allowsContentJavaScript = true
   //     configurationSettings.defaultWebpagePreferences = preferenceSettings

