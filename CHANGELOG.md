# Changelog

## [Unreleased]

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
[0.0.2]: https://github.com/manuelCarlos/Superstring/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/manuelCarlos/Superstring/releases/tag/0.0.1
