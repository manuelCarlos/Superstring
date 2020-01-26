//
//  Newline.swift
//  
//
//  Created by Manuel Lopes on 04.01.20.
//

#if canImport(UIKit)
import UIKit
#endif

public typealias Newline = NSAttributedString.Newline

extension NSAttributedString {
    
    public struct Newline: AttributedStringConvertible {
        
        public var attributedString: NSAttributedString {
            NSAttributedString(string: "\n")
        }
        
        // Used only to mitigate the compiler error: `initialiser is inaccessible due to 'internal' protection level`.
        public init() {}
    }
    
    
}
