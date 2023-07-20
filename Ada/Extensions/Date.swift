//
//  Date.swift
//  Ada
//
//  Created by Sean O'Connor on 7/11/23.
//

import Foundation

extension Date {
    static func fromUnix(from ts: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(ts))
    }

    func format(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .long) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
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
