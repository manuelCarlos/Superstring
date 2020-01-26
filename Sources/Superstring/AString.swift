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

public typealias AString = NSAttributedString.AString

extension NSAttributedString {
    
    public struct AString: AttributedStringConvertible {
        
        public let string: String
        public let attributes: Attributes
        
        public init(_ string: String, attributes: Attributes = [:]) {
            self.string = string
            self.attributes = attributes
        }
        
        public var attributedString: NSAttributedString {
            NSAttributedString(string: string, attributes: attributes)
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
        
        // MARK: - Private
        
        private func apply(_ newAttributes: Attributes) -> Self {
            var attributes = self.attributes
            // Merge the two dictionaries taking the value of the new attribute in case the key is duplicated.
            attributes.merge(newAttributes, uniquingKeysWith: { (_, new) in new } )
            return AString(string, attributes: attributes)
            
            // TODO: - See if using class instead of Struct improves performance ?!?
            // return a mutable self here instead of a new instance?
            //ERROR: Cannot use mutating member on immutable value: function call returns immutable value
            // because _functionBuilder uses a Static function:
            // static func buildBlock(_ components: AttributedStringConvertible...) -> NSMutableAttributedString
        }
    }
}
