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
    public var components: (String, Attributes) {
        ("\n", attributes)
    }
    
    
    public var attributedString: NSAttributedString {
        NSAttributedString(string: "\n", attributes: attributes)
    }
    
    public let attributes: Attributes
    
    public init(_ attributes: Attributes = [:]) {
        self.attributes = attributes
    }
    
    // MARK: - Internal
    
   public func apply(_ newAttributes: Attributes) -> Self {
        var attributes = self.attributes
        // Merge the two dictionaries taking the value of the new attribute in case the key is duplicated.
        attributes.merge(newAttributes, uniquingKeysWith: { (_, new) in new } )
        return Newline(attributes)
    }
}
