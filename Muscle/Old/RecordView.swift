//
//  RecordView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/25.
//

import SwiftUI

struct RecordView: View {
    @State var message = ""
    @State var screen = UIScreen.main.bounds
    
    init() {
        // navigationbarの色
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color(red: 0.43, green: 0.35, blue: 0.66))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        NavigationView() {
            ZStack {
                Color(red: 0.43, green: 0.43, blue: 0.43)
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                            .frame(width: UIScreen.main.bounds.width * 0.84, height: UIScreen.main.bounds.height * 0.05)
                        
                        HStack {
                            
                            Text("体重")
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                            Spacer()
                            TextField("00", text: $message)
                            
                                .multilineTextAlignment(TextAlignment.trailing)
                            Text("kg")
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                            
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                            .frame(width: UIScreen.main.bounds.width * 0.84, height: UIScreen.main.bounds.height * 0.05)
                        
                        HStack {
                            
                            Text("体脂肪率")
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                            Spacer()
                            Text("10%")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                                .foregroundColor(.white)
                            
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                            .frame(width: UIScreen.main.bounds.width * 0.84, height: UIScreen.main.bounds.height * 0.42)
                        VStack {
                            HStack {
                                Text("写真")
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                                            .frame(width: screen.width * 0.38, height: screen.height * 0.32)
                                        
                                        Text("写真なし")
                                    }
                                    
                                    Text("開始時の体型")
                                        .foregroundColor(.white)
                                }
                                VStack {
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                                            .frame(width: screen.width * 0.38, height: screen.height * 0.32)
                                        
                                        Text("写真なし")
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }
                Spacer()
            }
            // navigationbarの文字
            .navigationBarItems(
                leading:Text("測定結果入力")
                    .font(.title)
                    .frame(width: screen.width, alignment: .center)
                    .foregroundColor(.white))
            
            
        }
    }
}


struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
