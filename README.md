# 📦 Refds Shared

[![CI](https://github.com/rafaelesantos/refds-shared/actions/workflows/swift.yml/badge.svg)](https://github.com/rafaelesantos/refds-shared/actions/workflows/swift.yml)

`RefdsShared` is a collection of handy functions and extensions to facilitate Swift development. This package provides a variety of extensions for primitive types, date manipulation, and new components that can be easily integrated into other Swift projects.

## Features

- [x] **Extensions for Primitive Types**: Extensions for primitive types like String, Int, Double, etc., to add additional functionality and ease working with these types.
- [x] **Date Manipulation**: Functions to facilitate date manipulation, such as formatting, difference calculation, etc.
- [x] **New Components**: Custom components that can be easily integrated into user interfaces, such as new controls, custom views, etc.

## Installation

Add this project to your `Package.swift` file.

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/rafaelesantos/refds-shared.git", branch: "main")
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: [
                .product(
                    name: "RefdsShared",
                    package: "refds-shared"),
            ]),
    ]
)
```
