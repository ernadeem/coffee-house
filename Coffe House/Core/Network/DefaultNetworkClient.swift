//
//  DefaultNetworkClient.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation

class DefaultNetworkClient: NetworkClient {
    
    let networkTransport: NetworkTransport
    
    init(networkTransport: NetworkTransport) {
        
        self.networkTransport = networkTransport
    }
    
    func request<T:Decodable>(url: URL) async throws -> T {
        
        do {
            
            let (data,urlResponse) =  try await  networkTransport.request(url: url)
            
            guard let response =  urlResponse as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                
                throw NetworkError.invalidResponse
            }

           return try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            
            throw NetworkError.networkIssue
        }
    }
}
