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
    
    
    var body: some View {
        
        NavigationView(){
            ZStack {
                // 背景色
                Color(red: 0.43, green: 0.43, blue: 0.43)
                    .ignoresSafeArea()
                
                VStack{
                    
                    GeometryReader { bodyView in
                        LazyHStack(spacing: viewModel.carouselItemPadding()) {
                            ForEach(viewModel.infinityArray.indices, id: \.self) { index in
                                VStack{
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
                                        Image(viewModel.infinityArray[index])
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: screen.width * 0.82, height: screen.height * 0.39)
                                    }
                                    Spacer()
                                    ZStack {
                                        // ブロック背景
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(red: 0.49, green: 0.49, blue: 0.49))
                                            .frame(width: viewModel.carouselItemWidth(), height: UIScreen.main.bounds.height * 0.29)
                                            .padding(.leading, viewModel.carouselLeadingPadding(index: index, bodyView: bodyView))
                                        Image("\(viewModel.infinityArray[index])ボディ")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: screen.width * 0.75, maxHeight: screen.height * 0.26)
                                        
                                    }
                                }
                                .offset(x: dragOffset)
                                .offset(x: viewModel.carouselOffsetX(bodyView: bodyView))
                                .animation(viewModel.dragAnimation)
                                .gesture(
                                    DragGesture()
                                        .updating($dragOffset, body: { (value, state, _) in
                                            state = value.translation.width
                                        })
                                        .onChanged({ value in
                                            viewModel.onChangedDragGesture()
                                        })
                                        .onEnded({ value in
                                            viewModel.updateCurrentIndex(dragGestureValue: value, bodyView: bodyView)
                                        })
                                )
                            }
                        }
                        
                    }
                    
                    
                    
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

