//
//  ConfigSheet.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import SwiftUI

struct ConfigSheet: View {
    @EnvironmentObject var urlManager:EnvironmentURLManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    VStack{
                        Toggle(isOn: self.$urlManager.sortAppearance){
                            Text("ソート順")
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
