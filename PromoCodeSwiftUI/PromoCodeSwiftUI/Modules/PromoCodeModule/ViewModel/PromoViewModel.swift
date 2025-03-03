//
//  PromoViewModel.swift
//  PromoCodeSwiftUI
//
//  Created by Александр Белый on 28.02.2025.
//

import Foundation
import SwiftUI

class PromoViewModel: ObservableObject {
    
    
    
    @Published var promoCode: [Order] = [.init(screenTitle: "", promocodes: [Order.Promocode.init(title: "HELLO", percent: 5, endDate: Date(), info: "Промокод действует на первый заказ в приложении", active: true)], products: [Order.Product.init(price: 20.0, title: "hell")], paymentDiscount: 20.0, baseDiscount: 20.0),
                                         .init(screenTitle: "hello", promocodes: [Order.Promocode.init(title: "VESNA23", percent: 5, endDate: Date(), info: "kek", active: false)], products: [Order.Product.init(price: 20.0, title: "hell")], paymentDiscount: 20.0, baseDiscount: 20.0),
                                         .init(screenTitle: "hello", promocodes: [Order.Promocode.init(title: "432330000", percent: 5, endDate: Date(), info: "", active: true)], products: [Order.Product.init(price: 20.0, title: "hell")], paymentDiscount: 20.0, baseDiscount: 20.0),
                                         .init(screenTitle: "hello", promocodes: [Order.Promocode.init(title: "552330000", percent: 5, endDate: Date(), info: "", active: true)], products: [Order.Product.init(price: 20.0, title: "hell")], paymentDiscount: 20.0, baseDiscount: 20.0),
                                         .init(screenTitle: "hello", promocodes: [Order.Promocode.init(title: "776330000", percent: 5, endDate: Date(), info: "", active: true)], products: [Order.Product.init(price: 20.0, title: "hell")], paymentDiscount: 20.0, baseDiscount: 20.0),
                                         
                                                   
    
    
    ]
    
}
