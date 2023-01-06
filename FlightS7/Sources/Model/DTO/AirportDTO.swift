//
//  AirportDTO.swift
//  FlightS7
//

import MapKit

struct AirportDTO: Hashable {
    let id: String
    let latitude: Double
    let longitude: Double
    let name: String
    let city: String
    let countryId: String
    
    var airportListPresentable: String {
        name + ", " + city + ", " + countryId
    }
    var airportCoordinates: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}

extension AirportDTO {
    init(object: AirportObject) {
        id = object.id
        latitude = object.latitude
        longitude = object.longitude
        name = object.name
        city = object.city
        countryId = object.countryId
    }
}
    extension AirportDTO {
        init(response: AirportResponse) {
            id = response.id
            latitude = response.latitude
            longitude = response.longitude
            name = response.name
            city = response.city
            countryId = response.countryId
        }
    }
