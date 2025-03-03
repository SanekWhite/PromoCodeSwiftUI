//
//  Extension.swift
//  PromoCodeSwiftUI
//
//  Created by Александр Белый on 01.03.2025.
//
import Foundation

extension Date {
    func formattedForPromo() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "d MMMM"
            return "По \(dateFormatter.string(from: self))"
        }
}
        
     
