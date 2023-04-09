//
//  File.swift
//  Figma
//
//  Created by Kirill Dev on 06.04.2023.
//

import UIKit

//MARK: - Image Downloader Manager

final class ImageDownloaderManager{
    
    static let shared = ImageDownloaderManager()
    private init() {}
    
    func fetchImage(from imageUrl: String?, with completion: @escaping(UIImage) -> Void) {
        guard let stringUrl = imageUrl else {return}
        guard let url = URL(string: stringUrl) else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error)
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
}
