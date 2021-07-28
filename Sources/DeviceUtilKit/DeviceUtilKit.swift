import UIKit //UIColor

//
public class DeviceUtilKit {
    //static let v_major
    public var version = "0.2.1"
    
}

public class DeviceUtil {
    
    /// Using Hex String with hash to create UIColor with alpha translution.
    /// - Warning: The "#" symbol is stripped from beginning of the string.
    /// - Parameters:
    ///   - hexString: Hex String, EX: "#ff0000"
    ///   - alpha: alpha value is 0~1.0
    /// - Returns: created color
    internal class func colorFrom(hex hexString : String, alpha: CGFloat = 1.0) ->UIColor{
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
        self.colorFrom(hex: "006736", alpha: 1.0)
    }
    /// Raze2Color
    public static var raze2Color: UIColor {
        self.colorFrom(hex: "FCFFFD", alpha: 1.0)
    }
}
//version
//0.1.0 : first API
//0.1.1 : provide Hex String to UIColor
//0.2.0 : provide pre-define color.
