//
//  RocketNetWorkService.swift
//  SpaceX_petProject
//
//  Created by Larry Livingston on 25.03.2023.
//

import Foundation

protocol RocketNetWorkService {
    func getRockets(completion: @escaping (Result<[Rocket], Error>) -> Void)
    
    func getLaunch(comletion:@escaping (Result<[Launch], Error>) -> Void)
}
enum Errors: Error {
    case invalidURL
    case invalidState
}

final class RocketNetWorkServiceImpl: RocketNetWorkService {

    private enum API {
        static let rockets = "https://api.spacexdata.com/v4/rockets"
        static let launches = "https://api.spacexdata.com/v4/launches"
    }
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
//    private let jsonEncoder: JSONEncoder

    init(urlSessionL: URLSession = .shared, jsonDecoder: JSONDecoder = .init()) {
        self.urlSession = urlSessionL
        self.jsonDecoder = jsonDecoder
    }
    
    func getRockets(completion: @escaping (Result<[Rocket], Error>) -> Void) {
        guard let url = URL(string: API.rockets) else {
            completion(.failure(Errors.invalidURL))
            return
        }
        let request = urlSession.dataTask(with: URLRequest(url: url)) { [jsonDecoder] data, response, error in
            switch(data, error) {
            case let (.some(data), nil):
                do {
                    let rockets = try jsonDecoder.decode([Rocket].self, from: data)
                    completion(.success(rockets))
                } catch {
                    completion(.failure(error))
                }
            case let (nil, .some(error)):
                completion(.failure(error))
            default:
                completion(.failure(Errors.invalidState))
            }
            
        }
    }
    
    func getLaunch(comletion: @escaping (Result<[Launch], Error>) -> Void) {
        //
    }
    
}
