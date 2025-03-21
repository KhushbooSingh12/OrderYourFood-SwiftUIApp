//
//  NetworkManager.swift
//  OderYourFood
//
//  Created by Khushi singh on 29/03/24.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared =  NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    
    private init() {}
    
// MARKS: - Func with completion handler
    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>)-> Void) {
//      
//        guard let url = URL(string: appetizerURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let data = try JSONDecoder().decode(AppetizerResponse.self, from: data)
//                completed(.success(data.request))
//            }catch {
//                completed(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    
// MARKS: - Func with async await
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
            do {
                let data = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                return data.request
            }catch {
                throw APError.invalidData
            }
    }
    
    func downloadImage(fromURLString urlString: String, completion: @escaping (UIImage?) -> Void) {
     let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        task.resume()
    }
}
