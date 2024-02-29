//
//  ProductDetailViewTests.swift
//  ChallengeTests
//
//  Created by Lucas Emiliano Benitez Joncic on 29/02/2024.
//
import XCTest
@testable import Challenge // Importa el módulo de tu aplicación
import SwiftUI

class ProductDetailViewTests: XCTestCase {
    let mockProduct = Product(id: "1", site_id: "site_id", title: "title", seller: .init(id: 1, nickname: "nickname"), price: 0.0, currency_id: "currency", available_quantity: 1, buying_mode: "buying", listing_type_id: "listing", stop_time: "stop", condition: "condition", permalink: "permalink", thumbnail: "thumbail", accepts_mercadopago: true, installments: .init(quantity: 2, amount: 100.00, rate: 1.00, currency_id: "currency"), shipping: .init(free_shipping: true, mode: "mode", tags: [""], logistic_type: "", store_pick_up: false), attributes: .init(arrayLiteral: .init(id: "", name: "", value_name: "")))
    
    func testProductDetailViewRendering() {
        let productDetailView = ProductDetailView(product: mockProduct)
        // Verifica que la vista se renderice sin errores
        XCTAssertNoThrow(productDetailView.body)
    }
}
