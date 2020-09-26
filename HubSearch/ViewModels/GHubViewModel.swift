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
                self.hubModel = try JSONDecoder().decode(HubModel.self, from: data)
                print(self.hubModel?.entries[0])
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
    
    func gettingNumOfRs() -> Int? {
        return filteredHubEntries?.count
    }                              //       return hubModel?.entries.count
    
    func gettingHubObject() -> HubModel? {
        return hubModel
    }
    
    func gettingHubEntries(index: Int) -> EntryModel? {
        return filteredHubEntries?[index]
    }
}
