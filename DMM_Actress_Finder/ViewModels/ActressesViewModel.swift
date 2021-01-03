//
//  ActressesViewModel.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import Foundation
import SwiftUI

class ActressesViewModel:ObservableObject{
    var urlString:String = ""
    @Published var total_count:Int = 0
    @Published var actresses:[ActressView] = []
    @Published var lastActress:ActressView?
    
    let formatter = DateFormatter()
    init(){
        self.formatter.calendar = Calendar(identifier: .gregorian)
        self.formatter.dateFormat = "yyyy-MM-dd"
    }
    
    func getNext(){
        let urlString = self.urlString
        guard let url = URL(string: urlString) else{return}
        URLSession.shared.dataTask(with: url, completionHandler: completionHandler).resume()
    }
    func completionHandler(data:Data?,response:URLResponse?,error:Error?){
        if let data = data{
            do{
                let actressesModel:ActressesModel = try JSONDecoder().decode(ActressesModel.self, from: data)
                DispatchQueue.main.async {
                    if let total_count = Int(actressesModel.result.total_count!){
                        self.total_count = total_count
                    }
                    
                    guard let actresses = actressesModel.result.actress else{return}
                    self.actresses += actresses.compactMap{actress in
                        var actressView = ActressView.init(actress: actress)
                        if actressView.birthday != ""{
                            let arr = actressView.birthday.components(separatedBy: "-").joined(separator: "/")
                            let date = self.formatter.date(from: arr)
                            let distance = date?.distance(to: Date())
                            let age = Int(Double(distance!)/(365.25*24*3600))
                            actressView.age = age
                        }
                        
                        
                        self.lastActress = actressView.hasPicture ? actressView:self.lastActress
                        
                        return self.actresses.contains(actressView) ? nil:actressView
                    }
                    //print(self.actresses)
                }
            }catch(let error){
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
}
