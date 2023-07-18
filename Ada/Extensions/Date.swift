//
//  Date.swift
//  Ada
//
//  Created by Sean O'Connor on 7/11/23.
//

import Foundation

extension Date {
    func fromUnix(from ts: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(ts))
    }

    func format() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        return dateFormatter.string(from: self)
    }

    func getRelativeTime(from date: Date) -> String {
        let relativeDateFormatter = RelativeDateTimeFormatter()
        relativeDateFormatter.unitsStyle = .short
        let value = String(relativeDateFormatter.localizedString(for: self, relativeTo: date))
        let str = value.hasPrefix("in") ? "now" : value
        return String(str.replacingOccurrences(of: ".", with: "").dropLast(4))
    }
}
