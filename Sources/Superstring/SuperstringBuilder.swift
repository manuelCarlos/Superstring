//
//  SuperstringBuilder.swift
//  Superstring
//
//  Created by manuel on 28.01.20.
//

#if canImport(UIKit)
import UIKit
#endif

// Set common types of UIFont and UIColor that can be used across UIKit and SwiftUI
public typealias Font = UIFont
public typealias Color = UIColor
public typealias Attributes = [NSAttributedString.Key: Any]
public typealias AttributedStringComponents = (string: String, attributes: Attributes)

@_functionBuilder
public struct SuperstringBuilder {

    public static func buildBlock(_ content: AttributedStringBuildable...) -> [AttributedStringComponents] {
        var componentsList: [AttributedStringComponents] = []
        content.forEach { componentsList.append($0.components) }
        return componentsList
    }
}
