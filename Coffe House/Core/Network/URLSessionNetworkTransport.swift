//
//  URLSessionNetworkTransport.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation

class URLSessionTransport: NetworkTransport {
    
    func request(url: URL) async throws -> (Data, URLResponse) {
        
        return try await URLSession.shared.data(from: url)
    }
}
