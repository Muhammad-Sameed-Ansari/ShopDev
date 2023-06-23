//
//  ContentView.swift
//  ShopDev
//
//  Created by Sameed Ansari on 14/06/2023.
//

import SwiftUI
import Lottie

struct ContentView: View {
    @StateObject var company = Company()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $company.personName)
                        TextField("Company Name", text: $company.companyName)
                    }
                    
                    Section {
                        TextField("Phone Number", text: $company.phoneNumber)
                            .keyboardType(.phonePad)
                        TextField("Email", text: $company.email)
                            .keyboardType(.emailAddress)
                    } header: {
                        Text("Contact Information")
                    }
                }
                
                NavigationLink {
                    if company.email == "leads@dev.com" {
                        Leads()
                    } else {
                        Technologies()
                            .environmentObject(company)
                    }
                } label: {
                    Text("Let's Shop")
                        .frame(maxWidth: 250, maxHeight: 40)
                        .font(.title2)
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
                .disabled(company.personName.isEmpty || company.companyName.isEmpty || company.phoneNumber.isEmpty || !company.email.isValidEmail())
            }
            
            .navigationTitle("Cup Of Coffee @ Cost Of A Sip")
            .navigationBarTitleDisplayMode(.large)
            .background(.regularMaterial)
        }
    }
}

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
