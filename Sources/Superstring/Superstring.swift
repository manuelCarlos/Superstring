//
//  Superstring.swift
//
//
//  Created by Manuel Lopes on 03.01.20.

#if canImport(UIKit)
import UIKit
#endif

public struct Superstring: AttributedStringConvertible {
    
    public let attributedString: NSAttributedString
    
    public init(@SuperstringBuilder _ builder: () -> AttributedStringConvertible) {
        attributedString = builder().attributedString
    }
}
