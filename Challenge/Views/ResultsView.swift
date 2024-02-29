//
//  ResultsView.swift
//  Challenge
//
//  Created by Lucas Emiliano Benitez Joncic on 28/02/2024.
//

import SwiftUI

struct ResultsView: View {
    var searchResults: [Product]
    
    var body: some View {
        List(searchResults) { product in
            NavigationLink(destination: ProductDetailView(product: product)) {
                Text(product.title)
            }
        }
    }
}
