//
//  AttributedStringConvertible.swift
//
//
//  Created by Manuel Lopes on 03.01.20.
//

#if canImport(UIKit)
import UIKit
#endif

/// A type with a textual representation, e.g customised by NSAttributedString.
///
/// Types that conform to the `AttributedStringConvertible` protocol can provide
/// their own representation to be used when converting an instance to a
/// NSAttributedString.
///
/// Conforming to the AttributedStringConvertible Protocol
/// ==================================================
///
/// Add `AttributedStringConvertible` conformance to your custom types by defining
/// an `attributedString` property.
///
/// For example, this custom `NewLine` struct uses a simple representation that
/// creates a new line as attributed string
///
///     struct NewLine: AttributedStringConvertible {
///
///        var attributedString: NSAttributedString {
///            NSAttributedString(string: "\n")
///        }
///     }
///
/// After implementing the `attributedString` property and declaring
/// `AttributedStringConvertible` conformance, the `NewLine` type provides its own
/// custom representation.
///
public protocol AttributedStringConvertible {
    var attributedString: NSAttributedString { get }
}
