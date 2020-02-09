//
//  Newline.swift
//  
//
//  Created by Manuel Lopes on 04.01.20.
//

#if canImport(UIKit)
import UIKit
#endif

public struct Newline: Equatable, AttributedStringBuildable {

    private let attributes: Attributes

    public init(_ attributes: Attributes = [:]) {
        self.attributes = attributes
    }

    // MARK: - AttributedStringBuildable

    public var components: AttributedStringComponents {
        ("\n", attributes)
    }

    public var attributedString: NSAttributedString {
        NSAttributedString(string: components.string, attributes: components.attributes)
    }

    public func applying(_ newAttributes: Attributes) -> Self {
        var attributes = self.attributes
        // Merge the two dictionaries taking the value of the new attribute in case the key is duplicated.
        attributes.merge(newAttributes, uniquingKeysWith: { (_, new) in new })
        return Newline(attributes)
    }

    // MARK: - Equatable

    public static func == (lhs: Newline, rhs: Newline) -> Bool {
        lhs.attributedString.isEqual(to: rhs.attributedString)
    }
}
