//
//  NSAttributedStringBuilder.swift
//  Superstring
//
//  Created by manuel on 28.01.20.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

// Set common types of UIFont and UIColor that can be used across UIKit and SwiftUI
public typealias Font = UIFont
public typealias Color = UIColor

public typealias Attributes = [NSAttributedString.Key: Any]

@_functionBuilder
public struct NSAttributedStringBuilder {
    
    public static func buildBlock(_ content: AttributedStringConvertible...) -> AttributedStringConvertible {
        let attributedString = NSMutableAttributedString()
        content.forEach({ attributedString.append($0.attributedString) })
        return attributedString
    }
}

extension NSAttributedString: AttributedStringConvertible {
    
    // MARK: - AttributedStringConvertible
    
    public var attributedString: NSAttributedString {
        self
    }
}
