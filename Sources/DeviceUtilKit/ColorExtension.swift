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
    
    public static var backgroundLColor : Color {
        Color(UIColor.rwBGLight)
    }
    public static var backgroundDColor : Color {
        Color(UIColor.rwBGDark)
    }
    
    public static var primaryButtonBackground : Color {
        Color(UIColor.rwGreen)
    }
    
    public static var secondaryButtonBackground : Color {
        Color(UIColor.rwGray)
    }
    
    public static var destructiveButtonBackground : Color {
        Color(UIColor.rwRed)
    }
    
    public static var buttonText: Color {
        Color(UIColor.white)
    }
}
