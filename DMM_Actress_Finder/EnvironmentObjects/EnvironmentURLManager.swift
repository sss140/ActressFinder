//
//  EnvironmentURLManager.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import Foundation

class EnvironmentURLManager:ObservableObject{
    let str:String = "lllll"
    //Picker
    @Published var sortValue:String
    @Published var sortAppearance:Bool = false
    let sort:Dictionary<String,String> = ["名前昇順":"name","名前降順":"-name","バスト昇順":"bust","バスト降順":"-bust","ウエスト昇順":"waist","ウエスト降順":"-waist","ヒップ昇順":"hip","ヒップ降順":"-hip","身長昇順":"height","身長降順":"-height","生年月日昇順":"birthday","生年月日降順":"-birthday","女優ID昇順":"id","女優ID降順":"-id"]
    var sortString:[String] = []
    
    
    init(){
        sortString = sort.map{$0.key}.sorted()
        sortValue = sortString.first!
    }
}
