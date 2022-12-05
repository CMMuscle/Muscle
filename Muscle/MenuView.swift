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
    
    @State var path: [String] = []
    @State var currentTab = 0
    
    
    var body: some View {
        
        NavigationStack(path: $path){
            ZStack(alignment: .leading) {
                
                // 背景色
                Color(red: 0.43, green: 0.43, blue: 0.43)
                    .ignoresSafeArea()
                    .gesture(
                        DragGesture()
                        // 画面から指を離した時のアクション
                            .onEnded({ value in
                                
                                // 右スワイプ時
                                if value.translation.width > 10  {
                                    
                                    // 画面遷移を許可
                                    viewModel.flag = true
                                    
                                } else if value.translation.width < -10{
                                    // スワイプ時
                                    viewModel.flag = false
                                }
                            })
                    )
                
                VStack{
                    
                    Spacer()
                    
                    VStack{
                        
                        Spacer()
                        
                        HStack {
                            
                            Spacer()
                            
                            ZStack {
                                
                                // ブロック背景
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                                    .frame(width: viewModel.carouselItemWidth(), height: viewModel.carouselItemHeight())
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                                
                                TabView(selection: $currentTab) {
                                    trainingItem(viewModel: viewModel, path: path)
                                    
                                        .onTapGesture{
                                            DispatchQueue.main.asyncAfter(deadline: .now() ) {
                                                
                                                // .navigationDestinationにて画面遷移
                                                path.append("received content")
                                                
                                            }
                                        }
                                        .tag(0)
                                    
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .frame(width: screen.width * 0.84, height: screen.height * 0.3)
                                
                                // 画面遷移
                                .navigationDestination(for: String.self) { string in
                                    TrainingView( trainingName: "プランク")
                                }
                                
                            }
                            
                            Spacer()
                            
                        }
                        
                        Spacer()
                        
                        ZStack {
                            
                            // ブロック背景
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                                .frame(width: viewModel.carouselItemWidth(), height: UIScreen.main.bounds.height * 0.29)
                                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                            
                            // 各筋トレの鍛えられる部位の表示
                            Image("プランクボディ")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: screen.width * 0.75, maxHeight: screen.height * 0.26)
                            
                        }
                        
                        Spacer()
                        
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
                
                SideMenuView()
                    .frame(width: screen.width * 0.5, height: screen.height)
                    .offset(x: viewModel.flag ? 0 :  -500)
                    .animation(.default, value: viewModel.flag)
                    .gesture(
                        DragGesture()
                        // 画面から指を離した時のアクション
                            .onEnded({ value in
                                
                                // 右スワイプ時
                                if value.translation.width > 10  {
                                    
                                    // 画面遷移を許可
                                    viewModel.flag = true
                                    
                                } else if value.translation.width < -10{
                                    // スワイプ時
                                    viewModel.flag = false
                                }
                            })
                    )
                    
            }
        }
    }
    
}

struct trainingItem: View {
    
    @ObservedObject var viewModel: MenuViewModel
    
    @State private var offset = CGFloat.zero
    @State private var closeOffset = CGFloat.zero
    @State private var openOffset = CGFloat.zero
    
    let screen = UIScreen.main.bounds
    
    @GestureState private var dragOffset: CGFloat = 0
    @State var isActive = false
    
    @State var path: [String]
    
    var body: some View {
        GeometryReader { bodyView in
            
            // 各ブロックの幅を設定
            LazyHStack(spacing: viewModel.carouselItemPadding()) {
                
                // ViewModel初期化時に用意した配列を使う
                ForEach(viewModel.infinityArray.indices, id: \.self) { index in
                    VStack {
                        
                       
                        ZStack {
                            
                            // ブロック背景
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                                .frame(width: viewModel.carouselItemWidth(), height: viewModel.carouselItemHeight())
                            
                            // 各筋トレの画像
                            Image(viewModel.infinityArray[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: viewModel.carouselItemWidth(), height: screen.height * 0.15)
                            // 筋トレ名
                            Text(viewModel.infinityArray[index])
                                .foregroundColor(.white)
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(EdgeInsets(top: 0, leading: screen.width * 0.05, bottom: screen.height * 0.25, trailing: 0))
                                
                            
                        }
                        
                        
                    }
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


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
