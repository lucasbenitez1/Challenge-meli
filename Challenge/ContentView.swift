//
//  ContentView.swift
//  Challenge
//
//  Created by Lucas Emiliano Benitez Joncic on 28/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var products: [Product] = []
    let productService = ProductService()
    var body: some View {
        NavigationView {
            SearchView(products: products)
                .navigationBarTitle("Mercado Libre")
        }

        .onAppear {
            productService.getProducts { result in
                switch result {
                case .success(let products):
                    self.products = products
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}
