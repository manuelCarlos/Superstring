//
//  Newline.swift
//  
//
//  Created by Manuel Lopes on 04.01.20.
//

#if canImport(UIKit)
import UIKit
#endif

public struct Newline: AttributedStringBuilder {
    
    public var attributedString: NSAttributedString {
        NSAttributedString(string: "\n", attributes: attributes)
    }
    
    public let attributes: Attributes
    
    /// Convenience NSAttributedString initialiser that accepts a closure of type `() -> AttributedStringConvertible`.
    /// - Parameter builder: a closure of type `() -> AttributedStringConvertible`.
    public init(@SuperstringBuilder _ builder: () -> Self) {
        self.attributes = builder().attributedString.attributes(at: 0, effectiveRange: nil)
    }
    
    public init(_ attributes: Attributes = [:]) {
        self.attributes = attributes
    }
    
    // MARK: - Internal
    
    func apply(_ newAttributes: Attributes) -> Self {
        var attributes = self.attributes
        // Merge the two dictionaries taking the value of the new attribute in case the key is duplicated.
        attributes.merge(newAttributes, uniquingKeysWith: { (_, new) in new } )
        return Newline(attributes)
    }
}
