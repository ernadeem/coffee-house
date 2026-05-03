//
//  NetworkClient.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation

protocol NetworkClient {
  
    func request<T:Decodable>(url: URL) async throws -> T
}


