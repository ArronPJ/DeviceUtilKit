//
//  PJButtonView.swift
//  DemoDeviceUKApp
//
//  Created by arronpj on 2021/9/1.
//  Copyright © 2021 arronpj. All rights reserved.
//

import SwiftUI
//import DeviceUtilKit
@available(iOS 13, *)
public enum PJButtonType {
    case primary
    case secondary
    case destructive
    
    var color : Color {
        switch self {
        case .primary:
            return Color.primaryButtonBackground
        case .secondary:
            return Color.secondaryButtonBackground
        case .destructive:
            return Color.destructiveButtonBackground
        }
    }
}
//arrow.left.square.fill
//arrow.right.square.fill
@available(iOS 13, *)
public struct PJButtonView : View {
    var title : String
    var type : PJButtonType
    var callback : () -> Void
    public init(title : String, type : PJButtonType, callback : @escaping ()-> Void) {
        self.title = title
        self.type = type
        self.callback = callback
    }
    public var body : some View {
        Button(action : { self.callback() }){
            ZStack(alignment: .center){
                HStack{
                    Spacer()
                    Text(title)
                        .font(.uiButtonLabel)
                        .foregroundColor(Color.buttonText)
                        .padding(15)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(Font.system(size: 14, weight: .bold))
                        .foregroundColor(type.color).frame(width:50, height: 50)
                        .background(Color.white.cornerRadius(9).padding(12))
                }
            }
        }
    .background(
        RoundedRectangle(cornerRadius: 9).fill(type.color)
        )
    }
}

@available(iOS 13, *)
extension Font {
    static var uiButtonLabel : Font {
        Font.system(size: 17).bold()
    }
}

// : previewLayout modify fixed layout for preview
@available(iOS 13, *)
struct PJButtonView_Preview : PreviewProvider {
    static var previews : some View {
        Group{
            buttons.colorScheme(.light)
            buttons.colorScheme(.dark)
        }
        
    }
    static var buttons : some View {
        VStack(spacing: 20){
            PJButtonView(title: "Pri", type: .primary, callback: { print("!! button1!!") })
            PJButtonView(title: "2nd", type: .secondary, callback: { print("!! button2!!") })
            PJButtonView(title: "Cancel", type: .destructive, callback: { print("!! Cancel!!") })
        }.padding(20).background(Color.backgroundLColor).previewLayout(.sizeThatFits)
    }
}
