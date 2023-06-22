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
    
    var body: some View {
//        if companies.count > 0 {
        NavigationStack {
            if companies.count > 0 {
                List(companies) {
                    Text($0.companyName)
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
