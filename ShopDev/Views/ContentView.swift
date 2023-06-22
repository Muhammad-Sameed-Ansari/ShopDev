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
        //        NavigationSplitView {
        //            LottieView(lottieFile: "coffee")
        //        } detail: {
        //            VStack {
        //                Form {
        //                    Section {
        //                        TextField("Name", text: $company.personName)
        //                        TextField("Company Name", text: $company.companyName)
        //                    }
        //
        //                    Section {
        //                        TextField("Phone Number", text: $company.phoneNumber)
        //                            .keyboardType(.phonePad)
        //                        TextField("Email", text: $company.email)
        //                            .keyboardType(.emailAddress)
        //                    } header: {
        //                        Text("Contact Information")
        //                    }
        //                }
        //
        //                NavigationLink {
        //                    if company.email == "leads@dev.com" {
        //                        Leads()
        //                    } else {
        //                        Technologies()
        //                            .environmentObject(company)
        //                    }
        //                } label: {
        //                    Text("Let's Shop")
        //                        .frame(maxWidth: 250, maxHeight: 40)
        //                        .font(.title2)
        //                        .bold()
        //                }
        //                .buttonStyle(.borderedProminent)
        //                //                .disabled(company.personName == "" || company.companyName == "" || company.phoneNumber == "" || company.email == "")
        //            }
        //            .navigationTitle("ShopDev")
        //            .navigationBarTitleDisplayMode(.large)
        //            .background(.regularMaterial)
        //        }
        
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
                //                .disabled(company.personName == "" || company.companyName == "" || company.phoneNumber == "" || company.email == "")
            }
            
            .navigationTitle("ShopDev")
            .navigationBarTitleDisplayMode(.large)
            .background(.regularMaterial)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
