//
//  Leads.swift
//  ShopDev
//
//  Created by Sameed Ansari on 20/06/2023.
//

import SwiftUI

struct Leads: View {
    var companies: [Company] {
        if let savedCompanies = UserDefaults.standard.object(forKey: "Companies") as? Data {
            let decoder = JSONDecoder()
            
            if let loadedCompanies = try? decoder.decode([Company].self, from: savedCompanies) {
                return loadedCompanies
            }
        }
        
        return []
    }
    var leadsString: String {
        var str = ""
        for company in companies {
            var companyDetails = ""
            
            companyDetails += "\(company.personName) - \(company.companyName) - \(company.phoneNumber) - \(company.email)\n"
            
            for product in company.products {
                companyDetails += "\(product.name)\n"
                companyDetails += "\(product.experienceLevel) - \(product.numberOfDevelopers) - \(product.cost)\n"
            }
            
            companyDetails += "Developer Cost: \(company.developerCost)\n"
            companyDetails += "GST (5%): \(company.gstCost)\n"
            companyDetails += "Total Cost: \(company.totalCost)\n"
            companyDetails += "-------------------------------\n"
            
            str += companyDetails
        }
        
        print("sameed\n\(str)")
        return str
    }
    
    var body: some View {
//        if companies.count > 0 {
        NavigationStack {
            if companies.count > 0 {
                VStack {
                    List(companies) {
                        Text($0.companyName)
                    }
                    
                    ShareLink(item: leadsString)
                    
                }
                .navigationTitle("Leads")
            } else {
                Text("No leads YET!!!")
                    .bold()
            }
        }
//        } else {
//            Text("No leads YET!!!")
//                .bold()
//        }
    }
}

struct Leads_Previews: PreviewProvider {
    static var previews: some View {
        Leads()
    }
}
