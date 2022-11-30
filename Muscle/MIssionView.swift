//
//  MIssionView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/29.
//

import SwiftUI

struct MIssionView: View {
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            
            // 背景色
            Color(red: 0.43, green: 0.43, blue: 0.43)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    
                    // ブロック背景
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.36)
                    
                    VStack {
                        
                        Text("デイリーミッション")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                        
                        
                        Text("あなたの努力が")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(alignment: .leading)
                        
                        Text("目に見える形でお届け")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity ,alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        Spacer()
                        
                    }
                    .frame(width: screen.width * 0.84, height: screen.height * 0.36)
                    
                }
                .padding()
                
                ZStack {
                    
                    // ブロック背景
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.36)
                }
            }
        }
    }
}

struct MIssionView_Previews: PreviewProvider {
    static var previews: some View {
        MIssionView()
    }
}
