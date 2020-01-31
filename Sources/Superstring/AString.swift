//
//  AString.swift
//
//
//  Created by Manuel Lopes on 03.01.20.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

public struct AString: AttributedStringBuilder {
    
    public let string: String
    public let attributes: Attributes
    
    public var attributedString: NSAttributedString {
        NSAttributedString(string: string, attributes: attributes)
    }
    
    /// Convenience NSAttributedString initialiser that accepts a closure of type `() -> AttributedStringConvertible`.
    /// - Parameter builder: a closure of type `() -> AttributedStringConvertible`.
    public init(@SuperstringBuilder _ builder: () -> Self) {
        self.string = ""
        self.attributes = builder().attributedString.attributes(at: 0, effectiveRange: nil)
    }
    
    public init(_ string: String, attributes: Attributes = [:]) {
        self.string = string
        self.attributes = attributes
    }
    
    // MARK: - Internal
    
    func apply(_ newAttributes: Attributes) -> Self {
        var attributes = self.attributes
        // Merge the two dictionaries taking the value of the new attribute in case the key is duplicated.
        attributes.merge(newAttributes, uniquingKeysWith: { (_, new) in new } )
        return AString(string, attributes: attributes)
    }
}
