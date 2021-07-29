//
//  DeviceViewUtil.swift
//  DeviceUtilKit
//
//  Created by arronpj on 2021/7/28.
//

import Foundation
import SwiftUI


//Color

//SwiftUI
@available(iOS 13, *)
extension UIColor {
    /// The SwiftUI color associated with the receiver.
    var suColor: Color { Color(self) }
}
@available(iOS 13, *)
extension Color {
    init(uiColor: UIColor) {
        self.init(red: Double(uiColor.rgba.red),
                  green: Double(uiColor.rgba.green),
                  blue: Double(uiColor.rgba.blue),
                  opacity: Double(uiColor.rgba.alpha))
    }
}


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
/*
public struct PJMeida {
//    public struct Demo {
//        public static var version : String {
//            return "0.1.0"
//        }
//        public static var name : String {
//            return "PJMediaNStuff"
//        }
//    }
}
//MARK: Media Item

extension PJMeida{
    enum PJRemoteType: String {
        case handmade = "handmade"
        case googleDrive = "google_drive"
        case awsS3 = "aws_s3"
    }
    public struct mediaItem : Decodable, Identifiable {
        
        public init(name: String = "",
                    score : Double = 0.0,
                    sysImage : String = "video.circle",
                    description: String = "")
        {
            self.name = name
            self.score = score
            self.sysImage = sysImage
            self.description = description
        }
        
        public let id: UUID = UUID()
        public let name: String
        public let sysImage: String
        public var score: Double
        public var description: String = ""
        
    }
    public static var demoItems : [mediaItem] {
        return [mediaItem(name: "video1",
                          score: 99.0,
                          sysImage:"video.circle",
                          description: "This is live play video content.")
            , mediaItem(name: "video2",
                        score: 98.0,
                        sysImage:"video",
                        description: "This is live play video content.")
            , mediaItem(name: "video3", score: 97.0, sysImage:"video.circle.fill", description: "This is live play video content.")
            , mediaItem(name: "music1", score: 97.0, sysImage:"tv.music.note", description: "This is live play video content.")
            , mediaItem(name: "music2", score: 97.0, sysImage:"tv.music.note.fill", description: "This is live play video content.")
        ]
    }
}



@available(iOS 13, *)
struct MediaItemCell: View {
    var item: PJMeida.mediaItem
    var body: some View {
        HStack {
            Image(systemName: item.sysImage)
                .resizable()
                .frame(width: 36.0, height: 36.0, alignment: .center)
                .padding([.leading])
            VStack(alignment: .leading) {
                Text("\(item.name)").font(.headline)
                Text("$\(String(format:"%.2f", item.score))").font(.subheadline)
                Text("\(item.description)").font(.subheadline)
            }.padding()
            Spacer()
        }
    }
}*/

// iOS 14

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


// PREVIEW
//@available(iOS 13.0.0, *)
//struct MediaItemCell_Previews: PreviewProvider {
//    static var previews: some View {
//        //MediaItemCell(item: PJMeida.demoItems[0])
//        TurnedOnView()
//    }
//}
