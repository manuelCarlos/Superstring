//
//  Ligature.swift
//  Superstring
//
//  Created by manuel on 10.02.20.
//

import Foundation

/// The value of this attribute is an integer.
/// Ligatures cause specific character combinations to be rendered using a single custom glyph
/// that corresponds to those characters.
/// The default value for this attribute is 1. (Value 2 is unsupported on iOS).
///
/// - none: the value 0 indicates no ligatures.
/// - default: this value indicates the use of the default ligatures.
/// - all: this value indicates the use of all ligatures.
public enum Ligature: Int {
    case none      = 0
    case `default` = 1

    #if canImport(AppKit)
    case all = 2 // Unsupported on iOS
    #endif
}
