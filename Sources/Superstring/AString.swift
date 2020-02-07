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

public struct AString: AttributedStringBuildable {

    public var components: AttributedStringComponents {
        (string, attributes)
    }

    public var attributedString: NSAttributedString {
        NSAttributedString(string: components.string, attributes: components.attributes)
    }

    private let string: String
    private let attributes: Attributes

    public init(_ string: String, attributes: Attributes = [:]) {
        self.string = string
        self.attributes = attributes
    }

    // MARK: - Internal

    public func applying(_ newAttributes: Attributes) -> Self {
        var attributes = self.attributes
        // Merge the two dictionaries taking the value of the new attribute in case the key is duplicated.
        attributes.merge(newAttributes, uniquingKeysWith: { (_, new) in new })
        return AString(string, attributes: attributes)
    }
}
