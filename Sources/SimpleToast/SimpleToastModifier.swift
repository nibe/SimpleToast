//
//  SimpleToastModifier.swift
//  
//
//  Created by Martin Albrecht on 17.08.20.
//  Copyright © 2020 Martin Albrecht. All rights reserved.
//
//  Licensed under Apache License v2.0
//

import SwiftUI


public enum SimpleToastModifierType {
    case fade, slide
}


protocol SimpleToastModifier: ViewModifier {
    var showToast: Bool { get set }
    var options: SimpleToastOptions? { get set }
}


public struct SimpleToastSlide: SimpleToastModifier {
    @Binding var showToast: Bool
    var options: SimpleToastOptions?
    
    public func body(content: Content) -> some View {
        content
            .frame(minHeight: 0)
            .frame(maxHeight: showToast ? .none : 0)
            .clipped()
            .animation(options?.animation)
    }
}


public struct SimpleToastFade: SimpleToastModifier {
    @Binding var showToast: Bool
    var options: SimpleToastOptions?
    
    public func body(content: Content) -> some View {
        content
            .opacity(showToast ? 1 : 0)
            .animation(.linear)
    }
}
