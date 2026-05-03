//
//  MockCoffeeListService.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 02/05/26.
//

import Foundation

final class MockCoffeeListService: CoffeeListService {
    
    func getCoffeeList() async throws -> [Coffee] {
        
        Coffee.preview
    }
}
