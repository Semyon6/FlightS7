//
//  setting.swift
//  FlightS7
//

enum Unit: String, Codable, CaseIterable {
    case kilometers
    case miles
}

struct Setting: Codable, Hashable {
    let type: [Unit]
    let selectedIndex: Int
}
