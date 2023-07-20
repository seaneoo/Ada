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

    func format(showTime: Bool = true) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = showTime ? .long : .none
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
