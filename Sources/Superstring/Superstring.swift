//
//  Superstring.swift
//
//
//  Created by Manuel Lopes on 03.01.20.

#if canImport(UIKit)
import UIKit
#endif

struct Superstring: AttributedStringConvertible {
    
    let attributedString: NSAttributedString
    
    public init(@NSAttributedStringBuilder _ builder: () -> AttributedStringConvertible) {
        attributedString = builder().attributedString
    }
}
