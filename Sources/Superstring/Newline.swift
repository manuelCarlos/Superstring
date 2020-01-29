//
//  Newline.swift
//  
//
//  Created by Manuel Lopes on 04.01.20.
//

#if canImport(UIKit)
import UIKit
#endif

public struct Newline: AttributedStringConvertible {
    
    public let attributes: Attributes
    
    public var attributedString: NSAttributedString {
        NSAttributedString(string: "\n", attributes: attributes)
    }
    
    // Used only to mitigate the compiler error: `initialiser is inaccessible due to 'internal' protection level`.
    public init(_ attributes: Attributes = [:]) {
        self.attributes = attributes
    }
    
    /// Convenience NSAttributedString initialiser that accepts a closure of type `() -> AttributedStringConvertible`.
    /// - Parameter builder: a closure of type `() -> AttributedStringConvertible`.
    public init(@NSAttributedStringBuilder _ builder: () -> AttributedStringConvertible) {
        self.attributes = builder().attributedString.attributes(at: 0, effectiveRange: nil)
    }
    
    public func backgroundColor(_ color: Color) -> Self {
         apply([.backgroundColor: color])
     }
     
     public func font(_ font: Font) -> Self {
         apply([.font: font])
     }
     
     public func foregroundColor(_ color: Color) -> Self {
         apply([.foregroundColor: color])
     }
    
    private func apply(_ newAttributes: Attributes) -> Self {
         var attributes = self.attributes
         // Merge the two dictionaries taking the value of the new attribute in case the key is duplicated.
         attributes.merge(newAttributes, uniquingKeysWith: { (_, new) in new } )
         return Newline(attributes)
         
         // TODO: - See if using class instead of Struct improves performance ?!?
         // return a mutable self here instead of a new instance?
         //ERROR: Cannot use mutating member on immutable value: function call returns immutable value
         // because _functionBuilder uses a Static function:
         // static func buildBlock(_ components: AttributedStringConvertible...) -> NSMutableAttributedString
     }
}
