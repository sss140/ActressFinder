//
//  ContentView.swift
//  DMM_Actress_Finder
//
//  Created by 佐藤一成 on 2021/01/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowingSheet:Bool = false
    
    var body: some View {
        HStack{
            Button(action:{isShowingSheet.toggle()}){
                Image(systemName: "gear").font(.largeTitle).padding()
            }
            .sheet(isPresented: $isShowingSheet,onDismiss: {
                //self.actressVM.actresses.removeAll()
                //self.actressVM.urlManager.resetOffset()
                //self.actressVM.getNext()
            }){
                ConfigSheet()
                   // .environmentObject(EnvironmentURLManager)
            }
            Spacer()
            //Toggle("", isOn: $isObtainPicture).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
