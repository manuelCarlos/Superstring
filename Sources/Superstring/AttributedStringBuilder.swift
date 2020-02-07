//
//  AttributedStringBuilder.swift
//  Superstring
//
//  Created by manuel on 30.01.20.
//

import Foundation

/// A type that provides the necessary components to build an attributed string.
///
/// Types that conform to `AttributedStringBuildable` protocol provide the basic components
/// with which an `NSAttributedString` can be built, i.e: a `String` and the `Attributes` that
/// apply to it.
public protocol AttributedStringBuildable {

    /// The basic components of an attributed string as a tuple of type (String, Attributes).
    var components: AttributedStringComponents { get }

    /// Return a new `AttributedStringBuildable` conforming type, given a new set of `Attributes`.
    /// - Parameter newAttributes: the attributes to be applied in the creation of a new `AttributedStringBuildable`.
    func applying(_ newAttributes: Attributes) -> Self
}

public extension AttributedStringBuildable {

    func backgroundColor(_ color: Color) -> Self {
        applying([.backgroundColor: color])
    }

    func font(_ font: Font) -> Self {
        applying([.font: font])
    }

    func foregroundColor(_ color: Color) -> Self {
        applying([.foregroundColor: color])
    }
}
