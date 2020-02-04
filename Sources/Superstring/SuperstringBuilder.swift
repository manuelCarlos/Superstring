//
//  SuperstringBuilder.swift
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
public struct SuperstringBuilder {
    
    public static func buildBlock(_ content: AttributedStringBuilder...) -> (AttributedStringConvertible, [(String, Attributes)] ){
        let resultString = NSMutableAttributedString()
        var components: [(String, Attributes)] = []
        
        content.forEach({
            components.append($0.components)
            resultString.append($0.attributedString)
//            print("🐸", $0.attributedString)
            print("🦋", $0.components)
        })
        
        return (resultString, components)
    }
}

extension NSAttributedString: AttributedStringConvertible {
    
    public var components: [String : Attributes] {
        [attributedString.string: attributes(at: 0, effectiveRange: nil)]
    }
    
    // MARK: - AttributedStringConvertible
    
    public var attributedString: NSAttributedString {
        self
    }
}
