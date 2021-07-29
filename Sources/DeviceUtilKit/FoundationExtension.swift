//
//  FoundationExtension.swift
//  DeviceUtilKit
//
//  Created by arronpj on 2021/7/29.
//

import Foundation

extension Double {
///FYI = (https://gist.github.com/ohlulu/48b4dda28fdf5211a0b31554b8e0a261)
    public func ceiling(toDecimal decimal: Int) -> Double {
        let numberOfDigits = abs(pow(10.0, Double(decimal)))
        if self.sign == .minus {
            return Double(Int(self * numberOfDigits)) / numberOfDigits
        } else {
            return Double(ceil(self * numberOfDigits)) / numberOfDigits
        }
    }
    public func rounding(toDecimal decimal: Int) -> Double {
        let numberOfDigits = pow(10.0, Double(decimal))
        return (self * numberOfDigits).rounded(.toNearestOrAwayFromZero) / numberOfDigits
    }
}
