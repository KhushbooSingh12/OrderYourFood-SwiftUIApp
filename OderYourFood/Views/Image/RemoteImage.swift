//
//  RemoteImage.swift
//  OderYourFood
//
//  Created by Khushi singh on 29/03/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiimage in
            guard let uiimage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder")
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString)
                
            }
    }
}
