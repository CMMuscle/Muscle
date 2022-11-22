//
//  MenuView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/09/26.
//

import SwiftUI

struct MenuView: View {
    @StateObject var viewModel = MenuViewModel()
    @State var message = ""
    let screen = UIScreen.main.bounds
    
    
    
    var body: some View {
        
        NavigationView(){
            ZStack {
                // 背景色
                Color(red: 0.43, green: 0.43, blue: 0.43)
                    .ignoresSafeArea()
                
                VStack{
                    HStack {
                        // 筋トレ名
                        Text("腕立て")
                            .font(.title2)
                            .padding()
                        Spacer()
                    }
                    ZStack {
                        // ブロック背景
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                            .frame(maxWidth: screen.width * 0.84, maxHeight: screen.height * 0.39)
                        Image("プランク")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screen.width * 0.82, height: screen.height * 0.39)
                        
                    }
                    Spacer()
                    ZStack {
                        // ブロック背景
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                        
                            .frame(maxWidth: screen.width * 0.84, maxHeight: screen.height * 0.29)
                        Image("plankBody")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: screen.width * 0.75, maxHeight: screen.height * 0.26)
                        
                    }
                    .padding()
                }
                
            }
            // navigationbarの文字
            .navigationBarItems(leading:
                                    Text("Form Trainer")
                .font(.title)
                .frame(width: 175, alignment: .topLeading)
                                , trailing:
                                    Text("ブロンズ")
                .font(.title)
                .foregroundColor(.black)
            )
        }
        
    }
}

struct menyu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

