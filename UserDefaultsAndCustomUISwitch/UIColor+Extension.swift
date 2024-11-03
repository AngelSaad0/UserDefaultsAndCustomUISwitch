//
//  UIColor+Extension.swift
//  UserDefaultInSwift
//
//  Created by Engy on 7/31/2567 BE.
//

import UIKit




extension UIColor {
    // Initialize UIColor from hex string
    convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        guard hexString.count == 6 else {
            return nil
        }

        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0
        guard scanner.scanHexInt64(&hexNumber) else {
            return nil
        }

        let r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hexNumber & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    // Convert UIColor to hex string
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0

        return String(format: "#%06x", rgb)
    }

    // Random UIColor
    static func random() -> UIColor {
        return UIColor(red: .random(),
                       green: .random(),
                       blue: .random(),
                       alpha: 1.0)
    }

    // Hex string property
    var hex: String? {
        return self.toHexString()
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension Scanner {
    var scanLocation: Int {
        get {
            return currentIndex.utf16Offset(in: string)
        }
        set {
            currentIndex = string.index(string.startIndex, offsetBy: newValue)
        }
    }
}
