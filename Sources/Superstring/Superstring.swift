//
//  Superstring.swift
//
//
//  Created by Manuel Lopes on 03.01.20.

#if canImport(UIKit)
import UIKit
#endif

public struct Superstring: Equatable, Hashable {

    public let attributedString: NSAttributedString

    public init(_ attributes: Attributes = [:], @SuperstringBuilder _ builder: () -> [AttributedStringComponents]) {
        attributedString = Self.makeAttributedString(from: builder(), attributes: attributes)
    }

    public init(_ attributes: Attributes = [:], @SuperstringBuilder _ builder: () -> AttributedStringBuildable) {
        attributedString = Self.makeAttributedString(from: [builder().components], attributes: attributes)
    }

    // MARK: - Private

    private static func makeAttributedString(from components: [AttributedStringComponents], attributes: Attributes) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        components.forEach {
            let resultingAttributes = $0.attributes.merging(attributes, uniquingKeysWith: { (current, _) in current })
            attributedString.append(NSAttributedString(string: $0.string, attributes: resultingAttributes))
        }
        return attributedString
    }
}
