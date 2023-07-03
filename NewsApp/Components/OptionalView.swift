//
//  OptionalView.swift
//  NewsApp
//
//  Created by Huzaifa Arshad on 24/05/2023.
//

import Foundation
import SwiftUI

struct OptionalView<Value, Content>: View where Content: View {
    var content: (Value) -> Content
    var value: Value
    
    init?(_ value: Value?, @ViewBuilder content: @escaping (Value) -> Content) {
        guard let value = value else {
            return nil
        }
        self.value = value
        self.content = content
    }
    
    var body: some View {
        content(value)
    }
}

extension Optional where Wrapped: View {
    func fallbackView<T: View>(_ transform: () -> T) -> AnyView? {
        switch self {
            case .none:
                return AnyView(transform())
            case .some(let view):
                return AnyView(view)
        }
    }
    
    func fallbackView<T: View, Value>(_ value: Value?, _ transform: (Value) -> T) -> AnyView? {
        switch self {
            case .none:
                if let unwrapped = value {
                    return AnyView(transform(unwrapped))
                } else {
                    return nil
            }
            case .some(let view):
                return AnyView(view)
        }
    }
}
