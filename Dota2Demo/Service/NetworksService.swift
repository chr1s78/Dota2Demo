//
//  NetworksService.swift
//  Dota2Demo
//
//  Created by Chr1s on 2021/9/22.
//

import Foundation
import Combine

enum DotaError: Error {
    case someError
}

class NetworkService {
    static let shared = NetworkService()
    private init() { }
    
    var cancellable = Set<AnyCancellable>()
    
    public func fetchData() -> AnyPublisher<(Dota2Hero, Dota2Team), Error> {
        
        Future<(Dota2Hero, Dota2Team), Error> { [weak self] promise in
            
            if let self = self {
                let zipPublisher = Publishers.Zip(self.fetchHero(), self.fetchTeam())
                
                zipPublisher
                    .sink { completion in
                        switch completion {
                        case .finished:
                            print("finished")
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    } receiveValue: { items in
                        promise(.success(items))
                    }
                    .store(in: &self.cancellable)
            } else {
                promise(.failure(DotaError.someError))
            }
        }
        .eraseToAnyPublisher()
    }
    
    // MARK: - 获取英雄数据
    func fetchHero() -> AnyPublisher<Dota2Hero, Never> {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        guard let url = url else {
            return Just([]).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .filter { ($0.response as! HTTPURLResponse).statusCode == 200 }
            .map { $0.data }
            .decode(type: Dota2Hero.self, decoder: JSONDecoder())
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: - 获取战队数据
    func fetchTeam() -> AnyPublisher<Dota2Team, Never> {
        let url = URL(string: "https://api.opendota.com/api/teams")
        guard let url = url else {
            return Just([]).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .filter { ($0.response as! HTTPURLResponse).statusCode == 200 }
            .map { $0.data }
            .decode(type: Dota2Team.self, decoder: JSONDecoder())
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
}
