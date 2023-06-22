//
//  Technology.swift
//  ShopDev
//
//  Created by Sameed Ansari on 15/06/2023.
//

import Foundation

struct Technology: Identifiable, Codable {
    let experiences = ["Please Select", "Architect (10+ Years)", "Senior (5-10 Years)", "Junior (2-5 Years)", "Fresh (0-2 Years)"]
    
    var id = UUID()
    var name: String
    var image: String
    var experienceLevel: String
    var numberOfDevelopers: Int
    var cost: Int {
        var experienceCost: Int
        
        switch experienceLevel {
        case experiences[1]:
            experienceCost = 4000
        case experiences[2]:
            experienceCost = 2000
        case experiences[3]:
            experienceCost = 1000
        case experiences[4]:
            experienceCost = 500
        default:
            experienceCost = 0
        }
        
        return numberOfDevelopers * experienceCost
    }
}
