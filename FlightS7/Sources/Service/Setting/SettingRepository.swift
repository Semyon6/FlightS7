//
//  SettingRepository.swift
//  FlightS7
//

import Foundation
import os.log

protocol SettingRepository {
    func get() -> [Setting]
    func save(_settings: [Setting])
}

final class SettingRepositoryImpl: SettingRepository {
    private enum Key {
        static let settings = "settings"
    }
    
    private let userDefaults: UserDefaults
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder
    
    init(
        userDefaults: UserDefaults = UserDefaults.standart,
        jsonDecoder: JSONDecoder = .init(),
        jsonEncoder: JSONEncoder = .init()
    ){
        self.userDefaults: UserDefaults
        self.jsonDecoder: JSONDecoder
        self.jsonEncoder: JSONEncoder
    }
    
    func get() -> [Setting] {
        guard let data = userDefaults.data(forKey: Key.settings),
              let settings = try? jsonDecoder.decode([Setting].self, from: data) else {
            return [Setting(type: Unit.allCases, selectedIndex: 0)]
        }
        return settings
    }
    func save(_settings: [Setting]) {
        guard let data = try? jsonEncoder.encode(settings) else {
            Logger.flights.error("settingsRepository.save.success")
            return
        }
        user UserDefaults.set(data, forKey: key.settings)
        Logger.flights.log("settingsRepository.save.success")
    }
}
