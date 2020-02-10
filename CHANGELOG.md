# Changelog

## [Unreleased]

## [0.3.0] - 10.02.20

### Added

- `Ligature` public enum type.
- `Equatable` conformance to `AString` and `Newline`.
- `Equatable` and `Hashable`conformance to `Superstring`.
- Extended `AttributedStringBuildable` with:
  - `public func paragraphStyle(_ style: NSParagraphStyle) -> Self`
  - `public func ligature(_ ligature: Ligature) -> Self`
  - `public func kern(_ kern: CGFloat) -> Self `
  - `public func strikethrough(_ style: NSUnderlineStyle) -> Self`
  - `public func strikethroughColor(_ color: Color) -> Self`
  - `public func underline(_ style: NSUnderlineStyle) -> Self`
  - `public func strokeColor(_ color: Color) -> Self`
  - `public func strokeWidth(_ width: CGFloat) -> Self`
  - `public func shadow(x: CGFloat, y: CGFloat, blurRadius: CGFloat, color: Color?) -> Self`
  - `public func textEffect(_ textEffect: NSAttributedString.TextEffectStyle) -> Self`
  - `public func baselineOffset(_ offset: CGFloat) -> Self`
  - `public func underlineColor(_ color: Color) -> Self`
  - `public func obliqueness(_ obliqueness: CGFloat) -> Self`
  - `public func expansion(_ expansion: CGFloat) -> Self`

## [0.2.0] - 07.02.20

### Added

- Documentation for the `AttributedStringBuildable` protocol and its requirements.

### Changed

- `AttributedStringBuilder` has been renamed to `AttributedStringBuildable`.
- Applied `swiftlint autocorrect` with its default rules.

### Removed

- `AttributedStringConvertible` was removed.

## [0.1.0] - 05.02.20

### Added

- Support for base attributes on `Superstring`.
-  `AttributedStringComponents:  (string: String, attributes: Attributes)` public type alias.
- `var components: AttributedStringComponents` property to the `AttributedStringBuilder` protocol.

## [0.0.4] - 31.01.20

### Changed

- Declare `Superstring` public. 
- Declare `AttributedStringBuilder` protocol and its extension public.

## [0.0.3] - 30.01.20

### Added

- Support for attributes in `Newline`.
- `AttributedStringBuilder` protocol with default implementations of basic attribute modifiers.

### Changed

- `AString` and `Newline` now conform to the `AttributedStringBuilder` protocol.

## [0.0.2] - 29.01.20

### Added

- `Superstring` type as main attributed string constructor.

### Changed

- `NSAttributedString` is no longer extended with a  `init(@NSAttributedStringBuilder _ builder: () -> NSAttributedString)` initialiser.

### Fixed

- Build error when trying to create an attributed string using a single  `AString` invocation.

## [0.0.1] - 27.01.20

### Added

- `AttributedStringConvertible` protocol, `AString` and `Newline` types.
- README (wip).
- This CHANGELOG file.
- `Superstring` basic swift package structure.

[Unreleased]: https://github.com/manuelCarlos/Superstring/compare/v0.0.1...HEAD
[0.3.0]: https://github.com/manuelCarlos/Superstring/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/manuelCarlos/Superstring/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/manuelCarlos/Superstring/compare/0.0.4...0.1.0
[0.0.4]: https://github.com/manuelCarlos/Superstring/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/manuelCarlos/Superstring/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/manuelCarlos/Superstring/compare/0.0.1...0.0.2
[0.0.1]: https://github.com/manuelCarlos/Superstring/releases/tag/0.0.1
