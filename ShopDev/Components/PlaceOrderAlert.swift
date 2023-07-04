//
//  PlaceOrderAlert.swift
//  ShopDev
//
//  Created by Sameed Ansari on 21/06/2023.
//

import SwiftUI

struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        return findNavigationController(viewController: viewController.children.last)
    }
}

struct PlaceOrderAlert: View {
    @Binding var showAlert: Bool
    
    var body: some View {
        VStack {
            LottieView(lottieFile: "success")
                .frame(width: 500, height: 500)
            
            Text("Order Placed Successfully!!!")
                .font(.title)
                .bold()
            
            Button {
                NavigationUtil.popToRootView()
            } label: {
                Text("Done")
                    .frame(maxWidth: 250, maxHeight: 40)
                    .font(.title2)
                    .bold()
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
        }
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 100)
    }
}

struct PlaceOrderAlert_Previews: PreviewProvider {
    static var previews: some View {
        PlaceOrderAlert(showAlert: .constant(true))
    }
}
