//
//  Coffee.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import Foundation

struct Coffee: Decodable,Identifiable {
    
     let title: String
     let description: String
     let  id: Int
     let image: String
     let ingredients: [String]    
}
