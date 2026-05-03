//
//  Coffe_HouseApp.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import SwiftUI

@main
struct Coffe_HouseApp: App {
    
    private let coffeeService: CoffeeListService

    
    init() {
        coffeeService = Configuration.setup()
    }

    
    var body: some Scene {
        
        WindowGroup {
            
            CoffeeListView(
                coffeeListService: coffeeService)
        }
    }
}
