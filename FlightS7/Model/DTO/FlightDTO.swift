//
//  FlightDTO.swift
//  FlightS7
//

struct FlightDTO: Hashable {
    let airlineId: String
    let flightNumber: Int
    let departureAirportId: String
    let arrivalAirportId: String
    
    var airportDetailsPresentable: String {
        airlineId + " " + "\(flightNumber)" + ": " + departureAirportId + " - " + arrivalAirportId
    }
}

extension FlightDTO {
    init(response: FlightResponse) {
        airlineId = response.airlineId
        flightNumber = response.flightNumber
        departureAirportId = response.departureAirportId
        arrivalAirportId = response.arrivalAirportId
    }
}

extension FlightDTO {
    init(object: FlightObject) {
        airlineId = object.airlineId
        flightNumber = object.flightNumber
        departureAirportId = object.departureAirportId
        arrivalAirportId = object.arrivalAirportId
    }
}
