//
//  Company.swift
//  ShopDev
//
//  Created by Sameed Ansari on 15/06/2023.
//

import Foundation

class Company: Identifiable, ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case personName, companyName, phoneNumber, email, products, developerCost
    }
    
    var id = UUID()
    @Published var personName = ""
    @Published var companyName = ""
    @Published var phoneNumber = ""
    @Published var email = ""
    @Published var products: [Technology] = []
    @Published private(set) var developerCost: Int = 0
    
    var gstCost: Double { Double(developerCost) * 0.05 }
    var totalCost: Double { gstCost + Double(developerCost) }
    
    init() { }
    
    func addToCart(product: Technology) {
        products.append(product)
        developerCost += product.cost
    }
    
    func removeFromCart(product: Technology) {
        developerCost -= product.cost
    }
    
    func resetComapnyDetails() {
        id = UUID()
        personName = ""
        companyName = ""
        phoneNumber = ""
        email = ""
        products = []
        developerCost = 0
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        personName = try container.decode(String.self, forKey: .personName)
        companyName = try container.decode(String.self, forKey: .companyName)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        email = try container.decode(String.self, forKey: .email)
        products = try container.decode([Technology].self, forKey: .products)
        developerCost = try container.decode(Int.self, forKey: .developerCost)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(personName, forKey: .personName)
        try container.encode(companyName, forKey: .companyName)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(email, forKey: .email)
        try container.encode(products, forKey: .products)
        try container.encode(developerCost, forKey: .developerCost)
    }
}
