//
//  ActressView.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import Foundation
import SwiftUI

struct ActressView:View,Equatable{
    static func == (lhs: ActressView, rhs: ActressView) -> Bool {
        lhs.id == rhs.id
    }
    
    
    var hasPicture:Bool{actress.imageURL?.large != nil}
    var actress:Actress
    
    
    var largeImageView:ImageView{ImageView(urlString: (actress.imageURL?.large ?? ""), imageSide: 100)}
    var smallImageView:ImageView{ImageView(urlString: (actress.imageURL?.small ?? ""), imageSide: 50)}
    
    var id:String{actress.id}
    var name:String{actress.name ?? ""}//
    var ruby:String{actress.ruby ?? ""}//
    var bust:String{actress.bust ?? ""}
    var cup:String{actress.cup ?? ""}
    var waist:String{actress.waist ?? ""}
    var hip:String{actress.hip ?? ""}
    var height:String{actress.height ?? ""}
    var birthday:String{actress.birthday ?? ""}//
    var age:Int = 0//
    var blood_type:String{actress.blood_type ?? ""}//
    var hobby:String{actress.hobby ?? ""}//
    var prefectures:String{actress.prefectures ?? ""}//
    var digital:String{actress.listURL?.digital ?? ""}
    var monthly_premium:String{actress.listURL?.monthly_premium ?? ""}
    var ppm:String{actress.listURL?.ppm ?? ""}
    var mono:String{actress.listURL?.mono ?? ""}
    var rental:String{actress.listURL?.rental ?? ""}
    
    var body: some View{
        HStack{
            largeImageView
            VStack{
                
                Spacer()
                Text(ruby).font(.caption)
                Text(name).font(.headline)
                Spacer()
                
                if age != 0{
                    Text("(\(age))").font(.caption)
                }
                
            }.padding()
            VStack(alignment: .leading){
                Spacer()
                if blood_type != ""{
                    Text("血液型；" + blood_type + "型").font(.caption)
                }
                if prefectures != ""{
                    Text("出身；" + prefectures).font(.caption)
                }
                if hobby != ""{
                    Text("趣味；" + hobby).font(.caption)
                }
            }
        }
    }
}
