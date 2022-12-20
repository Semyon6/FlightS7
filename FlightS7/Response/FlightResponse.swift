//
//  FlightResponse.swift
//  FlightS7
//
//  Created by Semyon Bolkisev on 20.12.2022.
//

struct FlightResponse: Decodable {
    let airlineId: String
    let flightNumber: Int
    let departureAirportId: String
    let arrivalAirportId: String
}
