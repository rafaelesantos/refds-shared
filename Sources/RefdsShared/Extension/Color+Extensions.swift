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
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    var id: String {
        asHex()
    }
    
    static var placeholder: Color {
        self.primary.opacity(0.3)
    }
    
    static var random: Color {
        Default.allCases.randomElement()!.rawValue
    }
    
    private var colorComponents: (
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat,
        alpha: CGFloat
    )? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        #if os(macOS)
        SystemColor(self)
            .usingColorSpace(.genericRGB)?
            .getRed(
                &r,
                green: &g,
                blue: &b,
                alpha: &a
            )
        #else
        guard SystemColor(self)
            .getRed(
                &r,
                green: &g,
                blue: &b,
                alpha: &a
            ) else { return nil }
        #endif
        
        return (r, g, b, a)
    }
    
    func asHex(alpha: Bool = false) -> String {
        guard let components = colorComponents else { return "#D2D2D2" }
        
        let r = Float(components.red)
        let g = Float(components.green)
        let b = Float(components.blue)
        let a = Float(components.alpha)
        
        if alpha {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                lroundf(r * 255),
                lroundf(g * 255),
                lroundf(b * 255),
                lroundf(a * 255)
            )
        } else {
            return String(
                format: "#%02lX%02lX%02lX",
                lroundf(r * 255),
                lroundf(g * 255),
                lroundf(b * 255)
            )
        }
    }
    
    static func background(for colorScheme: ColorScheme) -> Self {
        #if os(macOS)
        colorScheme == .light ? Color(hex: "F2F2F7") : Color(nsColor: .windowBackgroundColor)
        #elseif os(iOS)
        colorScheme == .light ? Color(hex: "F2F2F7") : Color(uiColor: .systemBackground)
        #else
        colorScheme == .light ? Color.white : Color.black
        #endif
    }
    
    static func secondaryBackground(for colorScheme: ColorScheme) -> Self {
        #if os(macOS)
        colorScheme == .light ? .white : Color(nsColor: .controlBackgroundColor)
        #elseif os(iOS)
        colorScheme == .light ? .white : Color(uiColor: .secondarySystemBackground)
        #else
        colorScheme == .light ? Color.white : Color.black
        #endif
    }
    
    enum Default: Identifiable, CaseIterable {
        case blue,
             brown,
             cyan,
             gray,
             green,
             indigo,
             mint,
             orange,
             pink,
             purple,
             red,
             teal,
             yellow,
             label,
             secondaryLabel
        
        public var id: String { rawValue.asHex() }

        public var rawValue: Color {
            switch self {
            case .blue: return .blue
            case .brown: return .brown
            case .cyan: return .cyan
            case .gray: return .gray
            case .green: return .green
            case .indigo: return .indigo
            case .mint: return .mint
            case .orange: return .orange
            case .pink: return .pink
            case .purple: return .purple
            case .red: return .red
            case .teal: return .teal
            case .yellow: return .yellow
            case .label: return .primary
            case .secondaryLabel: return .secondary
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
        try container.encode(asHex())
    }
}
