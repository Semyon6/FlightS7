//
//  AirportResponse.swift
//  FlightS7
//
//  Created by Semyon Bolkisev on 20.12.2022.
//

struct AirportResponse: Decodable, Equatable {
    let id: String
    let latitude: Double
    let longitude: Double
    let name: String
    let city: String
    let countryId: String
}

