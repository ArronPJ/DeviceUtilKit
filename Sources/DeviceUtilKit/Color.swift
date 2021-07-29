//
//  Color.swift
//  DeviceUtilKit
//
//  Created by arronpj on 2021/7/28.
//


import UIKit //UIColor

extension DeviceUtil {
//public class DeviceUtil {
    public class Color {
        /// Using Hex String with hash to create UIColor with alpha translution.
        /// - Warning: The "#" symbol is stripped from beginning of the string.
        /// - Parameters:
        ///   - hexString: Hex String, EX: "#ff0000"
        ///   - alpha: alpha value is 0~1.0
        /// - Returns: created color
        internal class func fromHex(_ hexString : String, alpha: CGFloat = 1.0) ->UIColor{
            let r,g,b : CGFloat
            let offset = hexString.hasPrefix("#") ? 1 : 0
            let start = hexString.index(hexString.startIndex, offsetBy: offset)
            let hexColor = String(hexString[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber : UInt64 = 0
            if scanner.scanHexInt64(&hexNumber){
                r = CGFloat((hexNumber & 0xff0000) >> 16 ) / 255
                g = CGFloat((hexNumber & 0xff0000) >> 8 ) / 255
                b = CGFloat(hexNumber & 0xff0000) / 255
                return UIColor(red: r, green: g, blue: b, alpha: alpha)
            }
            return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)//Default Color
        }
        
        /// RazeColor
        public static var razeColor: UIColor {
            self.fromHex("006736", alpha: 1.0)
        }
        /// Raze2Color
        public static var raze2Color: UIColor {
            self.fromHex("FCFFFD", alpha: 1.0)
        }

    }
    
}
//PART3
extension UIColor {

    static let demoRed = UIColor(netHex: 0xd4553d)
    static let demoBlack = UIColor(netHex: 0x595959)
    static let demoDeepBlack = UIColor(netHex: 0x222222)
    
    static let demoGreen = UIColor(netHex: 0xAED581)
    static let demoBlue = UIColor(netHex: 0x15a9e7)
    static let demoButtonBlue = UIColor(netHex: 0x157efb)
    static let demoWhite = UIColor(netHex: 0xffffff)
    static let demoLightGray = UIColor(netHex: 0xdddddd)
    static let demoGray = UIColor(netHex: 0xaaaaaa)
    static let demoDarkGray = UIColor(netHex: 0x888888)
}
//PART1
extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
//PART2

extension UIColor {
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    //let darkBlue = UIColor(hex: 0x191970, 1)
    convenience init(hex: UInt32, alpha: Double) {
        let divisor = Float(255)
        let red     = Float((hex & 0xFF0000) >> 16) / divisor
        let green   = Float((hex & 0x00FF00) >> 8) / divisor
        let blue    = Float(hex & 0x0000FF) / divisor
        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    static let colorAuthBackground = UIColor(netHex: 0xefeff4)//#EFEFF4

}
