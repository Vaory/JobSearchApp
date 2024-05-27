//
//  UiColors.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 04.04.2024.
//

import SwiftUI

extension Color {
    
    static let uiBlack = Color(hex: 0x000000)
    static let uiGrey1 = Color(hex: 0x222325)
    static let uiGrey2 = Color(hex: 0x313234)
    static let uiGrey3 = Color(hex: 0x858688)
    static let uiGrey4 = Color(hex: 0x9F9F9F)
    static let uiGrey5 = Color(hex: 0xDBDBDB)
    static let uiWhite = Color(hex: 0xFFFFFF)
    static let uiBlue = Color(hex: 0x2B7EFE)
    static let uiDarkBlue = Color(hex: 0x00427D)
    static let uiGreen = Color(hex: 0x4CB24E)
    static let uiDarkGreen = Color(hex: 0x015905)
    static let uiRed = Color(hex: 0xFF0000)
    static let uiShadows = Color(hex: 0x0C0C0C).opacity(0.9)
    
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0
        )
    }
}
