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
    @GestureState private var dragOffset: CGFloat = 0
    @State var isActive = false
    @State private var path: [String] = []
    
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    
    var body: some View {
        
        NavigationStack(path: $path){
            ZStack(alignment: .leading) {
                
                // 背景色
                Color(red: 0.43, green: 0.43, blue: 0.43)
                    .ignoresSafeArea()
                
                VStack{
                    GeometryReader { bodyView in
                        
                        // 各ブロックの幅を設定
                        LazyHStack(spacing: viewModel.carouselItemPadding()) {
                            
                            // ViewModel初期化時に用意した配列を使う
                            ForEach(viewModel.infinityArray.indices, id: \.self) { index in
                                VStack{
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        // 筋トレ名
                                        Text(viewModel.infinityArray[index])
                                            .font(.title2)
                                            .padding()
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    ZStack {
                                        
                                        // ブロック背景
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                                            .frame(width: viewModel.carouselItemWidth(), height: viewModel.carouselItemHeight())
                                            .padding(.leading, viewModel.carouselLeadingPadding(index: index, bodyView: bodyView))
                                        
                                        // 各筋トレの画像
                                        Image(viewModel.infinityArray[index])
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: screen.width * 0.82, height: screen.height * 0.39)
                                    }
                                    .onTapGesture{
                                        DispatchQueue.main.asyncAfter(deadline: .now() ) {
                                            // .navigationDestinationにて画面遷移
                                            path.append("received content")
                                            
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    ZStack {
                                        
                                        // ブロック背景
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                                            .frame(width: viewModel.carouselItemWidth(), height: UIScreen.main.bounds.height * 0.29)
                                            .padding(.leading, viewModel.carouselLeadingPadding(index: index, bodyView: bodyView))
                                        // 各筋トレの鍛えられる部位の表示
                                        Image("\(viewModel.infinityArray[index])ボディ")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: screen.width * 0.75, maxHeight: screen.height * 0.26)
                                        
                                    }
                                    
                                    Spacer()
                                    
                                }
                                
                                // 画面遷移
                                .navigationDestination(for: String.self) { string in
                                    RecordView()
                                }
                                // 初期値
                                .offset(x: dragOffset)
                                
                                // カルーセルのOffsetのX値を返す
                                .offset(x: viewModel.carouselOffsetX(bodyView: bodyView))
                                
                                // スワイプ時のアニメーション
                                .animation(viewModel.dragAnimation, value: dragOffset)
                                .gesture(
                                    DragGesture()
                                    
                                    // 値を更新
                                        .updating($dragOffset, body: { (value, state, _) in
                                            state = value.translation.width
                                        })
                                    
                                    // 値が更新された時のアクション
                                        .onChanged({ value in
                                            viewModel.onChangedDragGesture()
                                        })
                                    
                                    // 画面から指を離した時のアクション
                                        .onEnded({ value in
                                            
                                            // タッチ時
                                            if value.translation.width > -10 && value.translation.width < 10 {
                                                
                                                // 画面遷移を許可
                                                isActive = true
                                                
                                            } else { // スワイプ時
                                                isActive = false
                                                
                                                // 次のセルへ移動
                                                viewModel.updateCurrentIndex(dragGestureValue: value, bodyView: bodyView)
                                            }
                                        })
                                )
                            }
                        }
                    }
                }
                
                // navigationbarの文字
                .navigationBarItems(
                    leading: Text("Form Trainer")
                        .font(.title)
                        .frame(width: 175, alignment: .topLeading),
                    trailing: Text("ブロンズ")
                        .font(.title)
                        .foregroundColor(.black)
                )
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
