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
    public let components: [String : Attributes] = [:]
    public let componentss: [(String, Attributes)]
    
    
    public init(@SuperstringBuilder _ builder: () -> (AttributedStringConvertible, [(String, Attributes)])) {
        attributedString = NSAttributedString(string: "sdaf")  //builder().attributedString
        componentss = builder().1
        
        attributes  = [:]
        print("🚨", attributedString)
        print("🥎", componentss)
    }
    
    let attributes: Attributes
    
    public init(_ attributes: Attributes, @SuperstringBuilder _ builder: () -> (AttributedStringConvertible, [(String, Attributes)])) {
        self.attributes = attributes
        
        
        componentss = builder().1
        
        let resultString = NSMutableAttributedString()
     
        
        for c in componentss {
            let atts = c.1.merging(attributes, uniquingKeysWith: { (c, new) in c } )
            resultString.append(NSAttributedString(string: c.0, attributes: atts))
        }
        
    
        
        
          print("🥎", componentss)
        attributedString = resultString  //builder().attributedString
    }
    
//    private static func makeAttributedString(_ string: String, baseAttributes: Attributes, attributes: Attributes) -> NSAttributedString {
//        let at = baseAttributes.merge(attributes, uniquingKeysWith: { (_, new) in new } )
//        let mutableString = NSMutableAttributedString()
//    }
}
