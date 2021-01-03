//
//  ImageLoader.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import Foundation
import SwiftUI

struct ImageView:View{
    let imageSide:CGFloat
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(urlString:String,imageSide:CGFloat){
        self.imageSide = imageSide
        guard urlString != "" else{
            imageLoader.isCompleteLoad.toggle()
            return}
        guard let url = URL(string: urlString) else{
            imageLoader.isCompleteLoad.toggle()
            return}
        self.imageLoader.load(url: url)
    }
    var body:some View{
        if imageLoader.isCompleteLoad == false{
            ProgressView()
        }else{
            if let imageData = self.imageLoader.downloadData, let img = UIImage(data: imageData){
                Image(uiImage: img)
                    .resizable()
                    .frame(width: self.imageSide, height: self.imageSide)
                    .cornerRadius(10.0)
            }else{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: self.imageSide, height: self.imageSide)
                    .cornerRadius(0.0)
            }
        }
    }
}

class ImageLoader:ObservableObject{
    @Published var downloadData:Data? = nil
    var isCompleteLoad:Bool = false
    func load(url:URL){
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.isCompleteLoad = true
                    self.downloadData = data
                }
            }catch(let error){
                self.isCompleteLoad.toggle()
                print(error.localizedDescription)
            }
        }
    }
}

