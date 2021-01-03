//
//  ActressesModel.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import Foundation

struct ActressesModel:Codable {
    var request:Request?
    var result:Result
}

struct Request:Codable{
    struct Parameters:Codable {
        let api_id:String
    }
    var parameters:Parameters?
}

struct Result:Codable{
    var status:String?
    var result_count:Int?
    var total_count:String?
    //var first_position:String?
    
    var actress:[Actress]?
}

struct Actress:Codable{
    var id:String
    var name:String?
    var ruby:String?
    var bust:String?
    var cup:String?
    var waist:String?
    var hip:String?
    var height:String?
    var birthday:String?
    var blood_type:String?
    var hobby:String?
    var prefectures:String?
    struct ImageURL:Codable{
        var small:String?
        var large:String?
    }
    var imageURL:ImageURL?
    struct ListURL:Codable{
        var digital:String?
        var monthly_premium:String?
        var ppm:String?
        var mono:String?
        var rental:String?
    }
    var listURL:ListURL?
}

