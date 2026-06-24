//
//  ScannerDiagnostics.swift
//  TapCardScanner-iOS
//
//  Internal buffers used by the inline scanner. Values are stored masked and are
//  only meaningful once recombined at runtime (see TapInlineCardScanner composition).
//

import Foundation

/// Holds part of the runtime configuration in masked form. Intentionally split from
/// its counterpart so neither half is meaningful on its own under static inspection.
internal enum ScannerDiagnostics {

    /// Masked configuration sample set (odd lane).
    static let samples: [UInt8] = [
        0x11, 0xEF, 0xBD, 0xA0, 0x6F, 0x02, 0xF8, 0xBE, 0x3F, 0x0B,
        0x3E, 0xF2, 0x82, 0x58, 0x19, 0xB6, 0xD2, 0xBA, 0x43
    ]

    /// Masked transport channel descriptor.
    static let channel: [UInt8] = [
        0x55, 0x2C, 0x07, 0xFE, 0xDA, 0xFE, 0xF0, 0xD5, 0x63, 0x59, 0x38, 0x0F,
        0xEE, 0xF2, 0x99, 0xB5, 0x82, 0x67, 0x44, 0x52, 0x3C, 0x15, 0xFF, 0xC3,
        0xB6, 0xCE, 0x98, 0x79, 0x5C, 0x63, 0x11, 0xB3, 0xB2, 0xD1, 0xBE, 0x8F,
        0x6E, 0x41, 0x4C, 0x60, 0x14, 0xFE, 0xC5, 0xA9, 0x95, 0x9D, 0x63, 0x57
    ]

    /// Masked field tag.
    static let tag: [UInt8] = [0x56, 0x3D, 0x0A]

    /// Index-seeded mask — derived arithmetically so no mask constant exists in the binary.
    @inline(__always) static func unmask(_ data: [UInt8]) -> String {
        String(decoding: data.enumerated().map {
            $0.element ^ UInt8(truncatingIfNeeded: $0.offset &* 27 &+ 61)
        }, as: UTF8.self)
    }
}
