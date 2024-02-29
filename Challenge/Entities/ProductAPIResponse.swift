//
//  Product.swift
//  Challenge
//
//  Created by Lucas Emiliano Benitez Joncic on 28/02/2024.
//

struct ProductResponse: Codable {
    let site_id: String
    let paging: PagingInfo
    let results: [Product]
}

struct PagingInfo: Codable {
    let total: Int
    let offset: Int
    let limit: Int
    let primary_results: Int
}

struct Product: Codable, Identifiable {
    let id: String
    let site_id: String
    let title: String
    let seller: Seller
    let price: Double
    let currency_id: String
    let available_quantity: Int
    let buying_mode: String
    let listing_type_id: String
    let stop_time: String
    let condition: String
    let permalink: String
    let thumbnail: String
    let accepts_mercadopago: Bool
    let installments: Installments
    let shipping: ShippingInfo
    let attributes: [Attribute]
    
    struct Seller: Codable {
        let id: Int
        let nickname: String
    }
    
    struct Installments: Codable {
        let quantity: Int
        let amount: Double
        let rate: Double
        let currency_id: String
    }
    
    struct ShippingInfo: Codable {
        let free_shipping: Bool
        let mode: String
        let tags: [String]
        let logistic_type: String
        let store_pick_up: Bool
    }
    
    struct Attribute: Codable {
        let id: String
        let name: String
        let value_name: String?
    }
}
