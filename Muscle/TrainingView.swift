//
//  TrainingView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/30.
//

import SwiftUI

struct TrainingView: View {
    
    @Environment(\.dismiss) var dismiss
    let screen = UIScreen.main.bounds
    let trainingName: String
    
    var body: some View {
        ZStack {
            // 背景色
            Color(red: 0.43, green: 0.43, blue: 0.43)
                .ignoresSafeArea()
            
            VStack {
                
                // 筋トレフォーム確認
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                    Text(trainingName)
                        .font(.title2)
                        .offset(y: -screen.height * 0.1)
                    
                    Image(trainingName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: screen.height * 0.12)
                    
                    
                }
                .frame(width: screen.width * 0.84, height: screen.height * 0.27)
                .padding(EdgeInsets(top: screen.height * 0.05, leading: 0, bottom: 0, trailing: 0))
                
                Spacer()
                
                // セット数確認
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    VStack {
                        Text("セット数")
                            .font(.title2)
                            .padding()
                        
                        Spacer()
                        
                        HStack {
                            Text("3")
                                .font(.title) +
                            Text("セット") +
                            Text("60")
                                .font(.title) +
                            Text("秒")
                            
                        }
                        
                        Spacer()
                    }
                    
                    
                }
                .frame(width: screen.width * 0.84, height: screen.height * 0.2)
                .padding()
                
                Spacer()
                
                // スタートボタン
                ZStack {
                    RoundedRectangle(cornerRadius: 28)
                        .foregroundColor(Color("purple"))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    
                    VStack {
                        
                        Text("START")
                            .font(.title)
                        
                    }
                }
                .frame(width: screen.width * 0.84, height: screen.height * 0.27)
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button(
                        action: {
                            dismiss()
                        }, label: {
                            Text("＜ホーム")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    )
                }
            }
            ToolbarItem(placement: .principal) {
                Text("統計")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Spacer()
            }
            
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(trainingName: "プランク")
    }
}
