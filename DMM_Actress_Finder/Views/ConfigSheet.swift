//
//  ConfigSheet.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import SwiftUI
import Sliders

struct ConfigSheet: View {
    @EnvironmentObject var urlManager:EnvironmentURLManager
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    VStack{
                        Button(action: {
                            self.urlManager.getURL()
                        }){
                            Text("Button")
                        }
                    }
                    //bust
                    VStack{
                        Toggle(isOn: self.$urlManager.bustAppearance){
                            Text(self.urlManager.bustAppearance ? self.urlManager.bustString:"バスト")
                        }
                        if self.urlManager.bustAppearance{
                        RangeSlider(range: self.$urlManager.bustValue, in: 50...155, step: 1, onEditingChanged: {_ in
                            let max:Int = Int(self.urlManager.bustValue.upperBound)
                            let min:Int = Int(self.urlManager.bustValue.lowerBound)
                            self.urlManager.bustString = "バスト \(min)cm〜\(max)cm"
                        })
                        
                        }
                    }
                    //waist
                    
                    VStack{
                        Toggle(isOn: self.$urlManager.waistAppearance){
                            Text(self.urlManager.waistAppearance ? self.urlManager.waistString:"ウエスト")
                        }
                        if self.urlManager.waistAppearance{
                            RangeSlider(range: self.$urlManager.waistValue, in: 45...140, step: 1, onEditingChanged: {_ in
                                let max:Int = Int(self.urlManager.waistValue.upperBound)
                                let min:Int = Int(self.urlManager.waistValue.lowerBound)
                            self.urlManager.waistString = "ウエスト \(min)cm〜\(max)cm"
                        })
                        }
                    }
                   //Hip
                    VStack{
                        Toggle(isOn: self.$urlManager.hipAppearance){
                            Text(self.urlManager.hipAppearance ? self.urlManager.hipString:"ヒップ")
                        }
                        if self.urlManager.hipAppearance{
                            RangeSlider(range: self.$urlManager.hipValue, in: 25...150, step: 1, onEditingChanged: {_ in
                                let max:Int = Int(self.urlManager.hipValue.upperBound)
                                let min:Int = Int(self.urlManager.hipValue.lowerBound)
                            self.urlManager.hipString = "ヒップ \(min)cm〜\(max)cm"
                        })
                        }
                    }
                    //height
                    VStack{
                        Toggle(isOn: self.$urlManager.heightAppearance){
                            Text(self.urlManager.heightAppearance ? self.urlManager.heightString:"身長")
                        }
                        if self.urlManager.heightAppearance{
                            RangeSlider(range: self.$urlManager.heightValue, in: 130...205, step: 1, onEditingChanged: {_ in
                                let max:Int = Int(self.urlManager.heightValue.upperBound)
                                let min:Int = Int(self.urlManager.heightValue.lowerBound)
                                self.urlManager.heightString = "身長 \(min)cm〜\(max)cm"
                        })
                        }
                    }
                    
                    //sort
                    VStack{
                        Toggle(isOn: self.$urlManager.sortAppearance){
                            Text("ソート")
                        }
                        if self.urlManager.sortAppearance{
                            Picker(selection: self.$urlManager.sortValue, label: Text("Sort")){
                                ForEach(self.urlManager.sortString, id: \.self){item in
                                    Text(item)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            }))
        }
    }
}

struct ConfigSheet_Previews: PreviewProvider {
    static var previews: some View {
        ConfigSheet()
    }
}

