//
//  SearchView.swift
//  Challenge
//
//  Created by Lucas Emiliano Benitez Joncic on 28/02/2024.
//
import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let products: [Product]
    
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.title.contains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Buscar productos, marcas y más...", text: $searchText)
                .padding()
            Spacer()
            if filteredProducts.isEmpty {
                Text("Ups! Ese producto no lo tenemos")
                    .foregroundColor(.red)
                    .font(.headline)
                    .padding()
            } else {
                ResultsView(searchResults: filteredProducts)
            }
        }
    }
}
