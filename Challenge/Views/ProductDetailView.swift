//
//  ProductDetailView.swift
//  Challenge
//
//  Created by Lucas Emiliano Benitez Joncic on 28/02/2024.
//
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State var imageData: Data?
   @State private var loadingError: Error?
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
               if let imageData = imageData,
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.horizontal)
                } else if let error = loadingError {
                    Text("Error: \(error.localizedDescription)")
                        .foregroundColor(.red)
                } else {
                    Text("Cargando imagen...")
                }

                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Text("\(Utils.formatPrice(product.price))")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(.horizontal)
                    
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(product.attributes, id: \.id) { attribute in
                        HStack {
                            Text(attribute.name)
                                .fontWeight(.bold)
                            Text(attribute.value_name ?? "")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }.onAppear {
                loadImage()
            }
        }
    }
     func loadImage() {
        var imageUrlString = product.thumbnail
        if imageUrlString.hasPrefix("http://") {
            imageUrlString = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
        }
        
        guard let imageUrl = URL(string: imageUrlString) else {
            loadingError = NetworkError.invalidURL
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else {
                loadingError = error ?? NetworkError.unknown
                return
            }
            
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
}
