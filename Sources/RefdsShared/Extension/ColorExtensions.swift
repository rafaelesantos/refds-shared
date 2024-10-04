import SwiftUI
#if os(iOS)
import UIKit
#elseif os(watchOS)
import WatchKit
#elseif os(macOS)
import AppKit
#endif

public extension Color {
    #if os(macOS)
    typealias SystemColor = NSColor
    #else
    typealias SystemColor = UIColor
    #endif
    
    init(hex: String, opacity: Double = 1) {
        let hex = Color.normalize(hex)
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    
    var id: String {
        asHex
    }
    
    static var placeholder: Color {
        self.primary.opacity(0.3)
    }
    
    static var random: Color {
        Default.allCases.randomElement()!.rawValue
    }
    
    var asHex: String {
        guard let components = cgColor?.components,
              components.count >= 3 else { return "#28CD41" }
        let red, green, blue: CGFloat
        red = components[0]
        green = components[1]
        blue = components[2]
        
        let redInt = Int(red * 255)
        let greenInt = Int(green * 255)
        let blueInt = Int(blue * 255)
        
        return String(
            format: "#%02X%02X%02X",
            redInt,
            greenInt,
            blueInt
        )
    }
    
    fileprivate static func normalize(_ hex: String) -> String {
        let hex = hex.replacingOccurrences(of: "#", with: "")
        guard hex.count == 6 else { return "28CD41" }
        return hex
    }
    
    static func background(for colorScheme: ColorScheme) -> Self {
        #if os(macOS)
        colorScheme == .light ? Color.white : Color(nsColor: .windowBackgroundColor)
        #elseif os(iOS)
        colorScheme == .light ? Color.white : .black
        #else
        colorScheme == .light ? Color.white : Color.black
        #endif
    }
    
    static func secondaryBackground(for colorScheme: ColorScheme) -> Self {
        #if os(macOS)
        Color(nsColor: .controlBackgroundColor)
        #elseif os(iOS)
        Color(uiColor: .secondarySystemBackground)
        #else
        colorScheme == .light ? Color.white : Color.black
        #endif
    }
    
    enum Default: Identifiable, CaseIterable {
        case blue,
             brown,
             cyan,
             green,
             indigo,
             mint,
             orange,
             pink,
             purple,
             red,
             teal,
             yellow
        
        public var id: String { rawValue.asHex }

        public var rawValue: Color {
            switch self {
            case .blue: return .blue
            case .brown: return .brown
            case .cyan: return .cyan
            case .green: return .green
            case .indigo: return .indigo
            case .mint: return .mint
            case .orange: return .orange
            case .pink: return .pink
            case .purple: return .purple
            case .red: return .red
            case .teal: return .teal
            case .yellow: return .yellow
            }
        }
    }
}

extension Color: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let hexString = try container.decode(String.self)
        self.init(hex: hexString)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(asHex)
    }
}
