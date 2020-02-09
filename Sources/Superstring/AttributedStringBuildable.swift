//
//  AttributedStringBuildable.swift
//  Superstring
//
//  Created by manuel on 30.01.20.
//

#if canImport(UIKit)
import UIKit
#endif

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

// MARK: - Ligature

/// The value of this attribute is an integer.
/// Ligatures cause specific character combinations to be rendered using a single custom glyph
/// that corresponds to those characters.
/// The default value for this attribute is 1. (Value 2 is unsupported on iOS).
///
/// - noLigatures: the value 0 indicates no ligatures.
/// - default: this value indicates the use of the default ligatures.
/// - all: this value indicates the use of all ligatures.
public enum Ligature: Int {
    case noLigatures = 0
    case `default`   = 1

    #if canImport(AppKit)
    case all = 2 // Unsupported on iOS
    #endif
}

extension AttributedStringBuildable {

    /************************ Attributes ************************/

    @available(iOS 6.0, *)
    public func font(_ font: Font) -> Self {
        applying([.font: font])
    }
    @available(iOS 6.0, *)
    public func paragraphStyle(_ style: NSParagraphStyle) -> Self {
        applying([.paragraphStyle: style])
    }
    @available(iOS 6.0, *)
    public func foregroundColor(_ color: Color) -> Self {
        applying([.foregroundColor: color])
    }

    @available(iOS 6.0, *)
    public func backgroundColor(_ color: Color) -> Self {
        applying([.backgroundColor: color])
    }

    @available(iOS 6.0, *)
    public func ligature(_ ligature: Ligature) -> Self {
        applying([.ligature: ligature.rawValue])
    }

    /// CGFloat value, in points; for the amount to modify default kerning.
    /// - Parameter kern: 0 means kerning is disabled.
    @available(iOS 6.0, *)
    public func kern(_ kern: CGFloat) -> Self {
        applying([.kern: kern])
    }

    @available(iOS 6.0, *)
    public func strikethrough(_ style: NSUnderlineStyle) -> Self {
        return applying([.strikethroughStyle: style.rawValue])
    }

    @available(iOS 6.0, *)
    public func underline(style: NSUnderlineStyle) -> Self {
          return applying([.underlineStyle: style.rawValue])
      }

    @available(iOS 6.0, *)
    public func stroke(color: Color) -> Self {
        return applying([.strokeColor: color])
    }

    /// CGFloat floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone,
    /// negative for stroke and fill (a typical value for outlined text would be 3.0)
    /// - Parameter width: CGFloat floating point value, in percent of font point size.
    @available(iOS 6.0, *)
    public func stroke(width: CGFloat) -> Self {
        return applying([.strokeWidth: width])
    }

    @available(iOS 6.0, *)
    public func shadow(x: CGFloat, y: CGFloat, blurRadius: CGFloat, color: Color? = nil) -> Self {
        let shadow = NSShadow()
        shadow.shadowOffset = .init(width: x, height: y)
        shadow.shadowBlurRadius = blurRadius
        shadow.shadowColor = color

        return applying([.shadow: shadow])
    }

    @available(iOS 7.0, *)
    public func textEffect(_ textEffect: NSAttributedString.TextEffectStyle) -> Self {
         return applying([.textEffect: textEffect])
     }

    // TODO: - TODO: NSTextAttachment and Link
    //    @available(iOS 7.0, *)
    //    public static let attachment: NSAttributedString.Key // NSTextAttachment, default nil

    //    @available(iOS 7.0, *)
    //    public static let link: NSAttributedString.Key // NSURL (preferred) or NSString

     @available(iOS 7.0, *)
    public func baseline(offset: CGFloat) -> Self {
        applying([.baselineOffset: offset])
    }


    @available(iOS 7.0, *)
     public func underline(color: Color) -> Self {
           return applying([.underlineColor: color])
       }

    @available(iOS 7.0, *)
    public func strikethrough(color: Color) -> Self {
        return applying([.strikethroughColor: color])
    }

    @available(iOS 7.0, *)
    public func obliqueness(_ obliqueness: CGFloat) -> Self {
        applying([.obliqueness: obliqueness])
    }

    @available(iOS 7.0, *)
    public func expansion(_ expansion: CGFloat) -> Self {
        applying([.expansion: expansion])
    }
}
