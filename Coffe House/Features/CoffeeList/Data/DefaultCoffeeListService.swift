//
//  DefaultCoffeeListService.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation

class DefaultCoffeeListService: CoffeeListService {
  
    
    let networkClient:NetworkClient
    let url: URL
  
    init(networkClient: NetworkClient,url: URL) {
        
        self.networkClient = networkClient
        self.url = url
    }
    
    func getCoffeeList() async throws -> [Coffee] {
        
       return try await networkClient.request(url: url)
        
    }
    
}
