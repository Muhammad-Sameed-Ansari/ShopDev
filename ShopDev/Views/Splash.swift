//
//  Splash.swift
//  ShopDev
//
//  Created by Sameed Ansari on 20/06/2023.
//

import SwiftUI

struct Splash: View {
    @State private var columnVisibility =
    NavigationSplitViewVisibility.detailOnly
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            VStack {
                LottieView(lottieFile: "coffee")
//                    .background(.red)
                    .frame(height: 400)
                
                Text("All Order Placed During Collision Get First Month At 50% OFF")
                    .font(.title)
                    .padding()
                    .multilineTextAlignment(.center)
                    
                
                Spacer()
            }
            .toolbar(.hidden, for: .navigationBar)
        } detail:{
            VStack {
                Group {
                    Image("creatrixe")
                        
                        .frame(width: 900, height: 350)
                        .scaledToFit()
                    
                    Text("Sponsored By")
                        .font(.title)
                    
                    HStack {
                        Image("hazza-Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                        
                        Image("pixle-paddle-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                        
                        Image("PRM-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                    }
                    .frame(maxHeight: 100)
                    .padding()
                    .background(Color("logoBackground"))
                }
                .frame(maxHeight: .infinity, alignment: .center)
                
                HStack {
                    LottieView(lottieFile: "coffee")
                        .frame(maxWidth: 100)
                        .scaledToFit()

                    NavigationLink(destination: ContentView()/*.navigationBarBackButtonHidden(true)*/
                        .onAppear {
                            columnVisibility = NavigationSplitViewVisibility.doubleColumn
                        }) {
                        Text("Tap To Start")
                            .frame(maxWidth: 250, maxHeight: 40)
                            .font(.title2)
                            .bold()
                    }
                    .padding(.top, 25)
                    .buttonStyle(.borderedProminent)
                        
                    LottieView(lottieFile: "coffee")
                        .frame(maxWidth: 100)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .background(Color("backgroundColor"))
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}