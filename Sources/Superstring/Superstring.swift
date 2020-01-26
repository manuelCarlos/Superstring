//
//  Superstring.swift
//
//
//  Created by Manuel Lopes on 03.01.20.

#if canImport(UIKit)
import UIKit
#endif

// Set common types of UIFont and UIColor that can be used across UIKit and SwiftUI
public typealias Font = UIFont
public typealias Color = UIColor

public typealias Attributes = [NSAttributedString.Key: Any]

@_functionBuilder
public struct NSAttributedStringBuilder {
    
    public static func buildBlock(_ content: AttributedStringConvertible...) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        content.forEach({ attributedString.append($0.attributedString) })
        return attributedString
    }
}

extension NSAttributedString {
    
    public convenience init(@NSAttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}
