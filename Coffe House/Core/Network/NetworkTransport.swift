//
//  NetworkTransport.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation

protocol NetworkTransport {

    func request(url:URL) async throws -> (Data,URLResponse)
}



