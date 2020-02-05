//
//  AttributedStringBuilder.swift
//  Superstring
//
//  Created by manuel on 30.01.20.
//

import Foundation

// TODO: - add docs

public protocol AttributedStringBuilder {
    var components: AttributedStringComponents { get }
    func applying(_ newAttributes: Attributes) -> Self
}

public extension AttributedStringBuilder {
    
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
