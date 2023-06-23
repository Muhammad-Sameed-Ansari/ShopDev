//
//  Requirements.swift
//  ShopDev
//
//  Created by Sameed Ansari on 14/06/2023.
//

import SwiftUI

struct Requirements: View {
    @EnvironmentObject var company: Company
    
    var technologyName: String
    
    @State private var experienceLevel: String = "Please Select"
    @State private var numberOfDevelopers = 1
    
    let experiences = ["Please Select", "Architect (10+ Years)", "Senior (5-10 Years)", "Junior (2-5 Years)", "Fresh (0-2 Years)"]
    
    private var totalCost: Int {
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
        
        return experienceCost * numberOfDevelopers
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Picker("Experience Level", selection: $experienceLevel) {
                            ForEach(experiences, id: \.self) {
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Experience Level")
                    }
                    
                    Section {
                        Stepper("Number of Developers: \(numberOfDevelopers)", value: $numberOfDevelopers, in: 1...50)
                    } header: {
                        Text("Number Of Developers")
                    }
                    
                    Section {
                        Text(totalCost, format: .currency(code: "CAD"))
                    } header: {
                        Text("Total Cost")
                    }
                }
                
                Button {
                    if experienceLevel != "Please Select" {
                        let technology = Technology(name: technologyName, image: technologyName, experienceLevel: experienceLevel, numberOfDevelopers: numberOfDevelopers)
                        company.addToCart(product: technology)
                        experienceLevel = "Please Select"
                        numberOfDevelopers = 1
                    }
                } label: {
                    Text("Add To Cart")
                        .frame(maxWidth: 250, maxHeight: 40)
                        .font(.title2)
                        .bold()
                }
                .disabled(experienceLevel == "Please Select")
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
            .navigationTitle(technologyName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.regularMaterial)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        Cart()
                            .environmentObject(company)
                    } label: {
                        CartButton(numberOfProducts: company.products.count)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color("backgroundColor"))
        }
    }
}

struct Requirements_Previews: PreviewProvider {
    static var previews: some View {
        Requirements(technologyName: "iOS")
            .environmentObject(Company())
    }
}
