//
//  NetworkError.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation

enum NetworkError: Error {
    
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError
    case networkIssue
}
