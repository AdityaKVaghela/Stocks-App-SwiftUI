//
//  NetworkManager.swift
//  StoockmarketApp
//
//  Created by MacBook Pro on 09/12/22.
//

import Foundation

final class NetworkManager<T:Codable>{
    func fetch(from url:URL , completion: @escaping (Result<T, NetworkError>) -> Void){
        print("in Fetch")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            print("in url session" , url)
            guard  error == nil else {
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse(response: response!.description)))
                return
            }
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            }
            catch let err{
                completion(.failure(.decodingError(err: err.localizedDescription)))
                print(error)
            }
        }.resume()
    }
}
enum NetworkError : Error {
    case error(err: String)
    case invalidResponse(response:String)
    case invalidData
case decodingError(err : String)
    
}
