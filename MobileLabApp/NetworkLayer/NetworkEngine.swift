//
//  NetworkEngine.swift
//  MobileLabApp
//
//  Created by Artsem Sharubin on 11.03.2022.
//

import Foundation
import Alamofire

class NetworkEngine {
    
    func request<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURl
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        AF.request(url)
            .response { response in
                
                guard response != nil, let data = response.data else { return }
                
                DispatchQueue.main.async {
                    var responseObject: T
                    do {
                        responseObject = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(responseObject))
                    } catch {
                        print("error: \(error)")
                        completion(.failure(error))
                    }
                }
            }
    }
}
