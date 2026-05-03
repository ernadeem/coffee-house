//
//  Configuration.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 02/05/26.
//

import Foundation

struct Configuration {
    
    static func setup() -> CoffeeListService {
        
        let networkTransport = URLSessionTransport()
        let client = DefaultNetworkClient(networkTransport: networkTransport)

        let url = URL(string: "https://api.sampleapis.com/coffee/hot")!
       
        return DefaultCoffeeListService(
            networkClient: client,
            url: url
        )
        
    }
    
}
