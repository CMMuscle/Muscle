//
//  StartView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/28.
//

import SwiftUI

struct StartView: View {
    let screen = UIScreen.main.bounds
    @State var mail = ""
    @State var password = ""
    var body: some View {
        
        ZStack {
            // 背景色
            Color(red: 0.43, green: 0.43, blue: 0.43)
                .ignoresSafeArea()
            
            VStack {
                Group {
                    TabView{
                        // チュートリアル画面
                        startBlock()
                        startBlock()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 75, trailing: 0))
                    .tabViewStyle(.page)
                }
                
                Button(action: {
                    
                }, label: {
                    Text("新規アカウント登録")
                        .foregroundColor(.white)
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .background(Color("purple"))
                        .cornerRadius(28)
                })
                
                Button(action: {
                    
                }, label: {
                    Text("ログイン")
                        .foregroundColor(.white)
                        .frame(width: screen.width * 0.84, height: screen.height * 0.05)
                        .background(Color("purple"))
                        .cornerRadius(28)
                        .padding()
                })
                
                Spacer()
                
            }
        }
    }
}

struct startBlock: View {
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                    .frame(width: screen.width * 0.84, height: screen.height * 0.3)
                
                Image("プランク")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width * 0.82, height: screen.height * 0.3)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                    .frame(width: screen.width * 0.84, height: screen.height * 0.25)
                    .padding()
                
                VStack {
                    Text("グラフで日々の記録")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                    
                    Text("あなたの努力が")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                    
                    Text("目に見える形でお届け")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
