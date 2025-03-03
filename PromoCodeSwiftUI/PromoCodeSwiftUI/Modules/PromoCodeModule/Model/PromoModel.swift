//
//  PromoModel.swift
//  PromoCodeSwiftUI
//
//  Created by Александр Белый on 28.02.2025.
//

import Foundation

struct Order: Identifiable, Hashable {
    let id = UUID()
    struct Promocode: Identifiable, Hashable {
        let id = UUID()
        let title: String
        let percent: Int
        let endDate: Date?
        let info: String?
        var active: Bool
        
    }
    
    struct Product: Identifiable,Hashable {
        let id = UUID()
        let price: Double
        let title: String
    }
    
    var screenTitle: String

    var promocodes: [Promocode]
    
    
    
    let products: [Product]
    
    let paymentDiscount: Double?
    
    let baseDiscount: Double?
    
}
