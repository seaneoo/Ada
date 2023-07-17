//
//  Int.swift
//  Ada
//
//  Created by Sean O'Connor on 7/17/23.
//

import Foundation

extension Int {
    func formatShort() -> String {
        let d = Double(self)
        let thousand = d / 1000

        if thousand >= 1 {
            return "\(round(thousand * 10) / 10)K"
        } else {
            return "\(Int(d))"
        }
    }
}
