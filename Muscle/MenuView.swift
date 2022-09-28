//
//  MenuView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/09/26.
//

import SwiftUI

struct MenuView: View {
    @StateObject var viewModel = MenuViewModel()
    @State var image: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Image("\(viewModel.leftMenu[0])")
                    .resizable()
                    .frame(width: 150, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        Text("\(viewModel.leftMenu[0])")
                            .frame(width: 150, height: 200,alignment: .top)
                    )
                
                Button(action: {
                    image = viewModel.leftMenu[0]
                    viewModel.showingModal.toggle()
                }){
                    Text("選択")
                        .frame(width: 150, height: 50)
                        .background(Color.yellow)
                }
                .fullScreenCover(isPresented: $viewModel.showingModal) {
                    ReadyView(menuViewModel: viewModel, image: image)
                }
            }
        }
    }
}

struct menyu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

