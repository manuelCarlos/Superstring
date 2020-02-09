//
//  AString.swift
//
//
//  Created by Manuel Lopes on 03.01.20.
//

#if canImport(UIKit)
import UIKit
#endif

public struct AString: Equatable, AttributedStringBuildable {

    private let string: String
    private let attributes: Attributes

    public init(_ string: String, attributes: Attributes = [:]) {
        self.string = string
        self.attributes = attributes
    }

    // MARK: - AttributedStringBuildable

    public var components: AttributedStringComponents {
        (string, attributes)
    }

    public var attributedString: NSAttributedString {
        NSAttributedString(string: components.string, attributes: components.attributes)
    }

    public func applying(_ newAttributes: Attributes) -> Self {
        var attributes = self.attributes
        // Merge the two dictionaries taking the value of the new attribute in case the key is duplicated.
        attributes.merge(newAttributes, uniquingKeysWith: { (_, new) in new })
        return AString(string, attributes: attributes)
    }

    // MARK: - Equatable

    public static func == (lhs: AString, rhs: AString) -> Bool {
        lhs.attributedString.isEqual(to: rhs.attributedString)
    }

}
