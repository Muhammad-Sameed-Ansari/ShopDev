//
//  TechnologyCard.swift
//  ShopDev
//
//  Created by Sameed Ansari on 14/06/2023.
//

import SwiftUI

struct TechnologyCard: View {
    var technologyName: String
    
    var body: some View {
        VStack {
            Image(technologyName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
//                .scaledToFit()
                .padding()
            
            VStack {
                Text(technologyName)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.2, green: 0.2, blue: 0.3))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 0.2, green: 0.2, blue: 0.3))
        }
    }
}

struct TechnologyCard_Previews: PreviewProvider {
    static var previews: some View {
        TechnologyCard(technologyName: "iOS")
    }
}
