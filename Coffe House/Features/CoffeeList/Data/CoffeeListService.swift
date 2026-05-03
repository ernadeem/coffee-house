//
//  CoffeeListService.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation

//Test3
protocol CoffeeListService {
    
    func getCoffeeList() async throws -> [Coffee]
}
