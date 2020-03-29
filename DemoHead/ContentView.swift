//
//  ContentView.swift
//  DemoHead
//
//  Created by Aaron Kuan on 2020/3/22.
//  Copyright © 2020 Aaron Kuan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var headName = "Hijab"
    @State var BodyName = "Blazer-2"
    @State var FaceName = "Angry with Fang"
    
    let heads = ["Bantu Knots", "Hijab", "Gray Short"]
    let bodys = ["Blazer-1","Blazer-2" ,"Blazer-3"]
    let faces = ["Angry with Fang", "Blank", "Awe"]
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image(headName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100 )
                    .zIndex(1)
                    .overlay(
                        Image(FaceName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .offset(x:3, y: 10)
                        
                )
                
                Image(BodyName)
                    .resizable()
                    .scaledToFit()
                    .offset(x: 10, y: -25)
                Form {
                    
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(heads, id: \.self) { (item)  in
                                Image(item)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .onTapGesture {
                                    self.headName = item
                                }
                            }
                        }
                        //                        Picker(selection: $headName, label: Text("Head")) {
                        //                            ForEach(heads, id: \.self) { (item)  in
                        //                                Text(item)
                        //                            }
                        //                        }
                    }
                    
                    
                    
                    Picker(selection: $BodyName, label: Text("Body")) {
                        ForEach(bodys, id: \.self) { (item)  in
                            Text(item)
                        }
                    }
                    Picker(selection: $FaceName, label: Text("Face")) {
                        ForEach(faces, id: \.self) { (item)  in
                            Text(item)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
            }
            .navigationBarTitle("Change Image")

        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
