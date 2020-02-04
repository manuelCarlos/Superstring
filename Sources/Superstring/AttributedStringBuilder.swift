//
//  AttributedStringBuilder.swift
//  Superstring
//
//  Created by manuel on 30.01.20.
//

import Foundation

public protocol AttributedStringBuilder: AttributedStringConvertible {
    var components: (String, Attributes) { get }
    func apply(_ newAttributes: Attributes) -> Self
}

public extension AttributedStringBuilder {
    
    func backgroundColor(_ color: Color) -> Self {
        apply([.backgroundColor: color])
    }
    
    func font(_ font: Font) -> Self {
        apply([.font: font])
    }
    
    func foregroundColor(_ color: Color) -> Self {
        apply([.foregroundColor: color])
    }
}
