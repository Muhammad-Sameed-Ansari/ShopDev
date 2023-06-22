//
//  Technologies.swift
//  ShopDev
//
//  Created by Sameed Ansari on 14/06/2023.
//

import SwiftUI

struct Technologies: View {
    @EnvironmentObject var company: Company
    
    let data = ["iOS", "Android", "Flutter", "React Native", "MEAN", "MERN", "PHP", "Python", "Figma", "Unity 3d", "Unreal Engine", "SQA", "DevOps", "AWS", "Azure", "GCP"]
    
    let columns = [
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id: \.self) { item in
                        NavigationLink {
                            Requirements(technologyName: item)
                                .environmentObject(company)
                        } label: {
                            TechnologyCard(technologyName: item)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Choose Technology")
            .navigationBarTitleDisplayMode(.inline)
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
            .background(Color("backgroundColor"))
        }
    }
}

struct Technologies_Previews: PreviewProvider {
    static var previews: some View {
        Technologies()
            .environmentObject(Company())
    }
}
