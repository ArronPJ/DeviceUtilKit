
import Foundation

//
public class DeviceUtilKit {
    //static let v_major
    public var version = "0.3.13"
    
    public static var platform : String {
        var result = ""
        #if targetEnvironment(macCatalyst)
            result = "macOS"
        #else
            result = "iOS/iPadOS"
        #endif
        return result
    }
}
public struct DeviceUtil {
    
}


