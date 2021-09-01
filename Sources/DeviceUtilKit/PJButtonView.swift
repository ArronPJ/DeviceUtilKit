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
    case primary(withArrow: Bool)
    case secondary(withArrow: Bool)
    case destructive(withArrow: Bool)
    
    var hasArrow : Bool {
        switch self {
        case .primary(let hasArrow),
             .secondary(let hasArrow),
             .destructive(let hasArrow):
            return hasArrow
        }
    }
    
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
    private struct SizeKey : PreferenceKey {
        static func reduce(value: inout CGSize?, nextValue: ()-> CGSize?){
            value = value ?? nextValue()
        }
    }
    var title : String
    var type : PJButtonType
    var callback : () -> Void
    @State private var height : CGFloat?
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
                        .padding(15).background(
                            GeometryReader { proxy in
                                Color.clear.preference(key: SizeKey.self, value: proxy.size)
                            })
                    Spacer()
                }
                if type.hasArrow {
                    HStack{
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(Font.system(size: 14, weight: .bold))
                            .foregroundColor(type.color).frame(width:height, height: height)
                            .background(Color.white.cornerRadius(9).padding(12))
                    }
                }
            }
        }
        .frame(height: height)
    .background(
        RoundedRectangle(cornerRadius: 9).fill(type.color)
        ).onPreferenceChange(SizeKey.self) { size in
            self.height = size?.height
        }
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
            PJButtonView(title: "Pri", type: .primary(withArrow: true), callback: { print("!! button1!!") })
            PJButtonView(title: "2nd", type: .secondary(withArrow: false), callback: { print("!! button2!!") })
            PJButtonView(title: "Cancel", type: .destructive(withArrow: true), callback: { print("!! Cancel!!") })
        }.padding(20).background(Color.backgroundLColor).previewLayout(.sizeThatFits)
    }
}
