//
//  Extentions.swift
//  Decimal Math
//
//  Created by Oleg Yakushin on 7/2/23.
//

import Foundation
import SwiftUI
extension Color {
    init?(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var color: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&color)

        if hex.count == 6 {
            self.init(
                red: Double((color >> 16) & 0xFF) / 255.0,
                green: Double((color >> 8) & 0xFF) / 255.0,
                blue: Double(color & 0xFF) / 255.0
            )
        } else {
            return nil
        }
    }
}
