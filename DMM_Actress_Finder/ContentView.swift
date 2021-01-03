//
//  ContentView.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var urlManager:EnvironmentURLManager
    @StateObject var actressesVM:ActressesViewModel = ActressesViewModel()
    @State var isObtainPicture:Bool = false
    @State var isShowingSheet:Bool = true
    
    var body: some View {
        VStack{
            HStack{
                Button(action:{isShowingSheet.toggle()}){
                    Image(systemName: "gear").font(.largeTitle)
                }
                Text("\(self.actressesVM.actresses.count)/\(self.actressesVM.total_count)")
                .sheet(isPresented: $isShowingSheet,onDismiss: {
                    self.urlManager.resetOffset()
                    self.actressesVM.actresses.removeAll()
                    self.actressesVM.urlString = self.urlManager.getURL()
                    self.actressesVM.getNext()
                }){
                    ConfigSheet()
                }
                Spacer()
                Toggle("", isOn: $isObtainPicture)
            }
            List{
                ForEach(self.actressesVM.actresses, id: \.id){actress in
                    if (isObtainPicture || (isObtainPicture == false && actress.hasPicture)){
                        actress
                            .onAppear{
                            if let lastActress = actressesVM.lastActress, actress.id == lastActress.id{
                                self.urlManager.setOffset(total_count: self.actressesVM.total_count)
                                if self.urlManager.ableToGet{
                                    self.actressesVM.urlString = self.urlManager.getURL()
                                    actressesVM.getNext()
                                }
                                //actressesVM.urlManager.ableToGet ? actressesVM.getNext():nil
                            }
 
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
