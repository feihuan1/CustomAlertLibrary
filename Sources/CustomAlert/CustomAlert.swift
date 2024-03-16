// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  CustomAlertBox.swift
//  assignment
//
//  Created by Feihuan Peng on 3/15/24.
//

import SwiftUI

@available(macOS 10.15, *)
public struct CustomAlertView: View {
    var title: String
    var message: String
    var messageFontSize: CGFloat
    var boxSize: CGSize
    var boxBackgroundColor: Color
    var dismissAction: () -> Void

    public var body: some View {
        VStack {
            Text(title)
                .padding(.top, 20)
                .font(.title)
            Text(message)
                .font(.system(size: messageFontSize))
            Button("Close") {
                dismissAction()
            }
            .padding()
        }
        .frame(width: boxSize.width, height: boxSize.height)
        .background(boxBackgroundColor)
        .cornerRadius(10)
    }
}

@available(macOS 10.15, *)
public struct CustomAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    var title: String
    var message: String
    var messageFontSize: CGFloat
    var boxSize: CGSize
    var boxBackgroundColor: Color
    var dismissAction: () -> Void

    public func body(content: Content) -> some View {
        content
            .overlay(
                CustomAlertView(
                    title: title,
                    message: message,
                    messageFontSize: messageFontSize,
                    boxSize: boxSize,
                    boxBackgroundColor: boxBackgroundColor,
                    dismissAction: dismissAction
                )
                .opacity(isPresented ? 1 : 0)
                .animation(.easeInOut(duration: 0.2))
            )
    }
}

@available(macOS 10.15, *)
extension View {
    public func customAlert(isPresented: Binding<Bool>,
                            title: String,
                            message: String,
                            messageFontSize: CGFloat = 16,
                            boxSize: CGSize = CGSize(width: 300, height: 200),
                            boxBackgroundColor: Color = Color.white,
                            dismissAction: @escaping () -> Void) -> some View {
        self.modifier(CustomAlertModifier(isPresented: isPresented,
                                          title: title,
                                          message: message,
                                          messageFontSize: messageFontSize,
                                          boxSize: boxSize,
                                          boxBackgroundColor: boxBackgroundColor,
                                          dismissAction: dismissAction))
    }
}
