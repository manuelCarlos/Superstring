//
//  AttributedStringBuilder.swift
//  Superstring
//
//  Created by manuel on 30.01.20.
//

import Foundation

protocol AttributedStringBuilder: AttributedStringConvertible {
    func apply(_ newAttributes: Attributes) -> Self
}

extension AttributedStringBuilder {
    
    public func backgroundColor(_ color: Color) -> Self {
        apply([.backgroundColor: color])
    }
    
    public func font(_ font: Font) -> Self {
        apply([.font: font])
    }
    
    public func foregroundColor(_ color: Color) -> Self {
        apply([.foregroundColor: color])
    }
}
