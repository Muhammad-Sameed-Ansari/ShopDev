//
//  Cart.swift
//  ShopDev
//
//  Created by Sameed Ansari on 19/06/2023.
//

import SwiftUI

struct Cart: View {
    @EnvironmentObject var company: Company
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    List {
                        Section {
                            ForEach(company.products) { product in
                                HStack {
                                    Text("\(product.numberOfDevelopers) X")
                                    
                                    Image(product.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding()
                                    
                                    VStack {
                                        Text("\(product.experienceLevel)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("\(product.name)")
                                            .foregroundColor(Color.gray)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    
                                    Text("$\(product.cost)")
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onDelete(perform: removeItem)
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Developers Cost")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color.gray)
                            
                            Text("\(company.developerCost.formatted(.currency(code: "CAD")))")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .foregroundColor(Color.gray)
                        }
                        .padding([.horizontal, .top])
                        
                        HStack {
                            Text("GST (5%)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color.gray)
                            
                            Text("\(company.gstCost.formatted(.currency(code: "CAD")))")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .foregroundColor(Color.gray)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Order Total")
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(company.totalCost.formatted(.currency(code: "CAD")))")
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .bold()
                        }
                        .padding([.horizontal])
                        
                        Button {
                            showAlert.toggle()
                            //                    var companies: [Company] = []
                            //
                            //                    if let savedCompanies = UserDefaults.standard.object(forKey: "Companies") as? Data {
                            //                        let decoder = JSONDecoder()
                            //
                            //                        if let loadedCompanies = try? decoder.decode([Company].self, from: savedCompanies) {
                            //                            companies = loadedCompanies
                            //                            print("sameed-companies loaded from user defaults\n\(loadedCompanies)")
                            //                        }
                            //                    }
                            //
                            //                    companies.append(company)
                            //
                            //                    let encoder = JSONEncoder()
                            //
                            //                    if let data = try? encoder.encode(companies) {
                            //                        UserDefaults.standard.set(data, forKey: "Companies")
                            //                        print("sameed-company added to user defaults")
                            //                    }
                            //
                            //                    print("sameed-after adding to user defaults\n \(companies)")
                        } label: {
                            Text("Place Order")
                                .frame(maxWidth: 250, maxHeight: 40)
                                .font(.title2)
                                .bold()
                        }
                        .padding(.bottom)
                        .disabled(company.products.count == 0)
                        .buttonStyle(.borderedProminent)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.white)
                            .shadow(radius: 5, x: 0, y: -9)
                        
                    )
                }
                .blur(radius: showAlert ? 30 : 0)
                
                if showAlert {
                    PlaceOrderAlert(showAlert: $showAlert)
                }
            }
            .navigationTitle("Number Of Developers: \(company.products.map{ $0.numberOfDevelopers }.reduce(0, +))")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color("backgroundColor"))
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        let index = offsets[offsets.startIndex]
        company.removeFromCart(product: company.products[index])
        
        company.products.remove(atOffsets: offsets)
        
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        let company = Company()
        company.products.append(Technology(name: "iOS", image: "iOS", experienceLevel: "Junior (1-2)", numberOfDevelopers: 3))
        return Cart()
                .environmentObject(company)
    }
}
