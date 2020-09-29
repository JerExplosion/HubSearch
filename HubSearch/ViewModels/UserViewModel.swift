//
//  UserViewModel.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation
           
class UserViewModel {
    
    var userModel: UserModel?
    
    var response: URLResponse?
    var erro: Error?
    
    var closureUponCompletion: (() -> ())?
    var apiDealer = APIDealer.init()
    
    func fetchingDataIntoVM(stringURL: String) {
        self.apiDealer.pullingData(stringURL: stringURL)
        
        apiDealer.normalClosure = {
            (data, response, erro) in
            
            guard let data = data else {
                print(NetworkErros.dataEmpty.hashValue)
                return
            }
            do {
                self.userModel = try JSONDecoder().decode(UserModel.self, from: data)
            } catch {
                print(erro?.localizedDescription)
                print("good catch")
            }
            self.response = response
            self.erro = erro
            self.closureUponCompletion?()
        }
        return
    }
}
