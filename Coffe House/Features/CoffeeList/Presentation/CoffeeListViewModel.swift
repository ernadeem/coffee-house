//
//  CoffeeListViewModel.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation
import Combine

final class CoffeeListViewModel: ObservableObject {
    
    @Published private(set) var state:State = .Idle
    
    let coffeListService: CoffeeListService
    
    init(coffeListService: CoffeeListService) {
        
        self.coffeListService = coffeListService
    }
    
    enum State {
        case Idle
        case loading
        case success([Coffee])
        case failure(String)
    }
    
    
    func getCoffeeList() async {
        
        state = .loading
        
        do {
            
            let coffeList =    try await coffeListService.getCoffeeList()
            state = .success(coffeList)
        }
        catch {
            
            state = .failure("Unable to load coffee list")
        }
                
    }
    
}
