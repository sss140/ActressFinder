//
//  EnvironmentURLManager.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import Foundation

class EnvironmentURLManager:ObservableObject{
    
    var requestParameter:Dictionary<String,String> = Dictionary<String,String>()
    
    //Bust
    @Published var bustValue:CountableClosedRange = 70...100
    @Published var bustAppearance:Bool = false
    @Published var bustString:String = "バスト70cm〜100cm"
    //waist 47-135
    @Published var waistValue:CountableClosedRange = 60...80
    @Published var waistAppearance:Bool = false
    @Published var waistString:String = "ウエスト60cm〜80cm"
    //Hip 50-150
    @Published var hipValue:CountableClosedRange = 60...80
    @Published var hipAppearance:Bool = false
    @Published var hipString:String = "ヒップ60cm〜80cm"
    //height 130-205
    @Published var heightValue:CountableClosedRange = 140...180
    @Published var heightAppearance:Bool = false
    @Published var heightString:String = "身長140cm〜180cm"
    
    //sort Picker
    @Published var sortValue:String
    @Published var sortAppearance:Bool = false
    let sort:Dictionary<String,String> = ["名前昇順":"name","名前降順":"-name","バスト昇順":"bust","バスト降順":"-bust","ウエスト昇順":"waist","ウエスト降順":"-waist","ヒップ昇順":"hip","ヒップ降順":"-hip","身長昇順":"height","身長降順":"-height","生年月日昇順":"birthday","生年月日降順":"-birthday","女優ID昇順":"id","女優ID降順":"-id"]
    var sortString:[String] = []
    
    
    init(){
        requestParameter["api_id"] = "J0Zp5Xx6C50uw9cgZrqu"
        requestParameter["affiliate_id"] = "s140s140-990"
        requestParameter["output"] = "json"
        requestParameter["hits"] = "20"
        
        
        
        
        sortString = sort.map{$0.key}.sorted()
        sortValue = sortString.first!
        
        
        
    }
    
    
    
    
    func getURL(){
        var url:String = "https://api.dmm.com/affiliate/v3/ActressSearch?"
        //sort
        requestParameter["sort"] = (self.sortAppearance) ? sort[self.sortValue]:""
        //bust
        if self.bustAppearance{
            let max = String(Int(self.bustValue.upperBound))
            requestParameter["lte_bust"] = max
            let min = String(Int(self.bustValue.lowerBound))
            requestParameter["gte_bust"] = min
        }else{
            requestParameter["gte_bust"] = ""
            requestParameter["lte_bust"] = ""
        }
        //waist
        if self.waistAppearance{
            let max = String(Int(self.waistValue.upperBound))
            requestParameter["lte_waist"] = max
            let min = String(Int(self.waistValue.lowerBound))
            requestParameter["gte_waist"] = min
        }else{
            requestParameter["gte_waist"] = ""
            requestParameter["lte_waist"] = ""
        }
        //hip
        if self.hipAppearance{
            let max = String(Int(self.hipValue.upperBound))
            requestParameter["lte_hip"] = max
            let min = String(Int(self.hipValue.lowerBound))
            requestParameter["gte_hip"] = min
        }else{
            requestParameter["gte_hip"] = ""
            requestParameter["lte_hip"] = ""
        }
        //height
        if self.heightAppearance{
            let max = String(Int(self.heightValue.upperBound))
            requestParameter["lte_height"] = max
            let min = String(Int(self.heightValue.lowerBound))
            requestParameter["gte_height"] = min
        }else{
            requestParameter["gte_height"] = ""
            requestParameter["lte_height"] = ""
        }
        
        
        
        //
        let parameters = requestParameter
            .compactMap { (key, value) in (value == "") ? nil:key + "=" + value}
        url += parameters.joined(separator: "&")
        print(url)
    }
}
