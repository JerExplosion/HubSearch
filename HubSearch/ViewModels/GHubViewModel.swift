//
//  GHubViewModel.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

class GHubViewModel {
        
    var apiDealer = APIDealer.init()
    var closureUponCompletion: (() ->())?
    var response: URLResponse?
    var erro: Error?
    var hubModel: HubModel?
    var filteredHubModel: HubModel?
    
    var hubEntries: [EntryModel]?
    var filteredHubEntries: [EntryModel]?
    
    //

   // updatedModel -> updatedItems
    
    var updatedHubModel: UpdatedHubModel?
    
//    var updatedHubItems: UpdatedHubItems?

    //
    
    func gettingDataForVM(stringURL: String) {
        apiDealer.pullingData(stringURL: stringURL)
        
        apiDealer.normalClosure = {
            (data, response, erro) in
            print("response's mime type is \(response?.mimeType)")
            print("data size is \(data)")
            
            guard let data = data else {
                print(NetworkErros.dataEmpty.localizedDescription)
                return
            }
            
            do {
                //
                self.updatedHubModel = try JSONDecoder().decode(UpdatedHubModel.self, from: data)
                print("avatar url is", self.updatedHubModel?.items[0].avatarURL)
            //    print("login name is", self.updatedHubModel?.items[2].loginName)
            //
          //      self.hubModel = try JSONDecoder().decode(HubModel.self, from: data)
         //       print(self.hubModel?.entries[0])
            } catch {
                print(erro.debugDescription)
                print("good catch")
            }
            self.response = response
            self.erro = erro
            self.closureUponCompletion?()
        }
        return
    }
    
    func gettingAvatarURL(index: Int) -> String? {
        return updatedHubModel?.items[index].avatarURL
    }
    
    func gettingNumOfRs() -> Int? {
        return updatedHubModel?.items.count
    }
    
    func gettingLoginName(index: Int) -> String? {
        return updatedHubModel?.items[index].loginName
    }
       
//    func gettingNumOfRs() -> Int? {
//        return filteredHubEntries?.count
//    }                              //       return hubModel?.entries.count
    
    func gettingHubObject() -> HubModel? {
        return hubModel
    }
    
    func gettingHubEntries(index: Int) -> EntryModel? {
        return filteredHubEntries?[index]
    }
}
