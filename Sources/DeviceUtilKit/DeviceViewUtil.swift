//
//  DeviceViewUtil.swift
//  DeviceUtilKit
//
//  Created by arronpj on 2021/7/28.
//

import Foundation
import SwiftUI



//Keywords:
//@available(iOS 11, macOS 10.13, *)
@available(iOS 13, *)
struct TurnedOnView: View {

    var body: some View {
        Image(systemName: "circle.fill")
    }

}
@available(iOS 13, *)
struct TurnedOffView: View {
    var body: some View {
        Image(systemName: "circle")
    }
}

    
@available(iOS 14, *)
struct PrimaryView : View {
    var body : some View {
        Text("PrimaryView")
    }
}
@available(iOS 14, *)
struct DetailView : View {
    var body : some View {
        Text("DetailView")
    }
}
@available(iOS 14, *)
struct DemoMDView : View {
    var body : some View {
        NavigationView {    //iOS 13,
            //SideBar()
            PrimaryView()
            DetailView()
        }
    }
}
//@available(iOS 14, *)
//struct SideBar: View {
//    var body : some View {
//        list(1..<100){ i in
//            Text("Row \(i)")
//        }
//        .listStyle(SidebarListStyle())
//    }
//}

// Usage ".sidebarStyle(if: UIDevice.current.userInterfaceIdiom == .pad)"
//進階
//extension List {
//    @ViewBuilder
//    func sidebarStyle(if flag: Bool) -> some View {
//        if flag {
//            self.listStyle(SidebarListStyle())
//        } else {
//            self.listStyle(InsetGroupedListStyle())
//        }
//    }
//}
