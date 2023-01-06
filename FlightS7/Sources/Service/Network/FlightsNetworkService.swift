import UIKit

protocol NetworkService {
    func getAirports(completion: @escaping ((Result<[AirportResponse], Error>) -> Void))
    func getFlights(completion: @escaping ((Result<[FlightResponse], Error>) -> Void))
}

enum NetworkErrors: Error {
    case invalidURL
    case invalidState
    
}
final class NetworkServiceImpl: NetworkService  {
    private enum API {
        static let airports  = "https://flightassets.datasavannah.com/test/airports.json"
        static let flights = "https://flightassets.datasavannah.com/test/flights.json"
    }
    
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .init()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }
    
    func getAirports(completion: @escaping ((Result<[AirportResponse], Error>) -> Void)) {
        makeRequest(urlString: API.airports, completion: completion)
    }
    
    func getFlights(completion: @escaping ((Result<[FlightResponse], Error>) -> Void)) {
        makeRequest(urlString: API.flights, completion: completion)
    }
    
    private func makeRequest<T: Decodable>(urlString: String, complrtion: @escaping ((Result<T, Error>) -> Void)) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkErrors.invalidURL))
            return
        }
    
        let request = urlSession.dataTask(with: url) { [jsonDecoder] data, response, error in switch (data, error) {
        case let (.some(data), nil):
            do {
                let response = try jsonDecoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
            }
        }
