//
//  ColorExtension.swift
//  DeviceUtilKit
//
//  Created by arronpj on 2021/9/1.
//

import SwiftUI

//Help Typo
@available(iOS 13, *)
extension Color {
    
    static var backgroundColor : Color {
        Color(UIColor.rwBGLight)
    }
    
    static var primaryButtonBackground : Color {
        Color(UIColor.rwGreen)
    }
    
    static var secondaryButtonBackground : Color {
        Color(UIColor.rwGray)
    }
    
    static var destructiveButtonBackground : Color {
        Color(UIColor.rwRed)
    }
    
    static var buttonText: Color {
        Color(UIColor.white)
    }
}
