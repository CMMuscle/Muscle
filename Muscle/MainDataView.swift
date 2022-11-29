//
//  MainDataView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/28.
//

import SwiftUI
import Charts

struct MainDataView: View {
    
    // 横に配置するブロックの個数
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    let screen = UIScreen.main.bounds
    @Environment(\.dismiss) var dismiss
    
    // グラフ切り替え
    @State var training =  ["メニュー","体重","体脂肪"]
    @State var currentTab = 0
    @State var color = ["ブルガリアンスクワット": Color.yellow,"プランク": .white, "腹筋": Color.red,   "サイドプランク": Color.orange, "スクワット": Color.blue,"腕立て": Color.green]
    
    var body: some View {
        ZStack {
            
            // 背景色
            Color(red: 0.43, green: 0.43, blue: 0.43)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    // ランク
                    ZStack {
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                            .frame(width: screen.width * 0.84, height: screen.height * 0.11)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                            .padding()
                        
                        VStack {
                            Text("ランク")
                                .foregroundColor(Color.white)
                            
                            ZStack {
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 0.61, green: 0.60, blue: 0.60))
                                        .frame(width: screen.width * 0.805, height: screen.height * 0.02)
                                        .padding(EdgeInsets(top: 0, leading: screen.width * 0.1, bottom: 0, trailing: 0))
                                    
                                    Spacer()
                                    
                                }
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    
                                    // あとで関数でサイズを調整できるようにする
                                        .frame(width: screen.width * 0.805, height: screen.height * 0.02, alignment: .leading)
                                        .padding(EdgeInsets(top: 0, leading: screen.width * 0.1, bottom: 0, trailing: 0))
                                    
                                    Spacer()
                                    
                                }
                                
                                Text("9/10")
                                    .foregroundColor(.black)
                                
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                    
                    // グラフ
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                            .frame(width: screen.width * 0.84, height: screen.height * 0.40)
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                        
                        VStack {
                            Picker(selection: $currentTab, label: Text("フルーツを選択")) {
                                ForEach(0 ..< training.count) { num in
                                    Text(self.training[num])
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())    // セグメントピッカースタイルの指定
                            .frame(width: screen.width * 0.8)
                            
                            TabView(selection: $currentTab) {
                                ChartView
                                    .tag(0)
                                Text("ya")
                                    .tag(1)
                                ChartView
                                    .tag(2)
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(width: screen.width * 0.84, height: screen.height * 0.3)
                            
                        }
                    }
                    
                    // 筋トレごとの記録
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(stats_Data) {stat in
                            VStack(spacing: 22) {
                                HStack {
                                    
                                    Text(stat.title)
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer(minLength: 0)
                                    
                                }
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 28)
                                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                                        .frame(width: screen.width * 0.42, height: screen.height * 0.18)
                                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                                    Circle()
                                        .trim(from: 0, to: 1)
                                        .stroke(stat.color.opacity(0.05), lineWidth: 10)
                                        .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
                                    Circle()
                                        .trim(from: 0, to: (stat.currentData / stat.goal))
                                        .stroke(stat.color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                        .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
                                        .rotationEffect(.init(degrees: -90))
                                    VStack {
                                        Text("2")
                                            .padding(2)
                                        Text(getPercent(current: stat.currentData, Goal: stat.goal))
                                            .font(.system(size: 22))
                                            .fontWeight(.bold)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        // ナビゲーションリンクの遷移先のバーを隠す
        .navigationBarBackButtonHidden(true)
        // ナビゲーションバーを編集する
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button(
                        action: {
                            dismiss()
                        }, label: {
                            Text("＜ホーム")
                                .foregroundColor(.white)
                                .font(.largeTitle)
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
    
    var ChartView: some View {
        HStack(spacing: 15) {
            // 配列workoutDataの個数分グラフを生成
            Chart {
                ForEach(workoutData) { work in
                    
                    BarMark(x: .value("day", work.day),
                            y: .value("workout_In_Min", work.workout_In_Min)
                    )
                    .foregroundStyle(by: .value("trainingKind", work.trainingKind))
                    
                }
                
            }
            .chartPlotStyle { plotContent in
                plotContent
                    .foregroundColor(.white)
                    .background(.gray.opacity(0.4))
                    .border(Color.white, width: 2)
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { value in
                    AxisGridLine(centered: true, stroke: StrokeStyle(dash: [2, 2]))
                        .foregroundStyle(Color.white)
                    
                    AxisValueLabel() { // construct Text here
                        if let intValue = value.as(String.self) {
                            Text("\(intValue)")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .chartYAxis {
                AxisMarks(values: .automatic) { value in
                    AxisGridLine(centered: true, stroke: StrokeStyle(dash: [2, 2]))
                        .foregroundStyle(Color.white)
                    AxisValueLabel() { // construct Text here
                        if let intValue = value.as(Int.self) {
                            
                            Text("\(intValue)")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
        }
        .chartForegroundStyleScale(["ブルガリアンスクワット": Color.yellow,"プランク": .white, "腹筋": Color.red,   "サイドプランク": Color.orange, "スクワット": Color.blue,"腕立て": Color.green])
        .frame(width: screen.width * 0.72,height: screen.height * 0.28)
        
    }
    
    
    func getPercent(current : CGFloat, Goal : CGFloat)->String {
        
        let per = (current / Goal) * 100
        
        return String(format: "%.1f", per)
    }
}



struct MainDataView_Previews: PreviewProvider {
    static var previews: some View {
        MainDataView()
    }
}

// サンプルデータ
struct Daily: Identifiable {
    var id: UUID
    var day: String
    var workout_In_Min : Int
    var trainingKind: String
}

var workoutData = [
    Daily(id: UUID(), day: "Day 1", workout_In_Min: 0, trainingKind: "腹筋"),
    Daily(id: UUID(), day: "Day 2", workout_In_Min: 0, trainingKind: "プランク"),
    Daily(id: UUID(), day: "Day 3", workout_In_Min: 0, trainingKind: "スクワット"),
    Daily(id: UUID(), day: "Day 4", workout_In_Min: 0, trainingKind: "サイドプランク"),
    Daily(id: UUID(), day: "Day 5", workout_In_Min: 0, trainingKind: "腹筋"),
    Daily(id: UUID(), day: "Day 6", workout_In_Min: 0, trainingKind: "腕立て"),
    Daily(id: UUID(), day: "Day 7", workout_In_Min: 0, trainingKind: "スクワット"),
    Daily(id: UUID(), day: "Day 1", workout_In_Min: 0, trainingKind: "プランク"),
    Daily(id: UUID(), day: "Day 1", workout_In_Min: 5, trainingKind: "腹筋"),
    Daily(id: UUID(), day: "Day 2", workout_In_Min: 3, trainingKind: "プランク"),
    Daily(id: UUID(), day: "Day 3", workout_In_Min: 3, trainingKind: "スクワット"),
    Daily(id: UUID(), day: "Day 4", workout_In_Min: 5, trainingKind: "プランク"),
    Daily(id: UUID(), day: "Day 4", workout_In_Min: 6, trainingKind: "腕立て"),
    Daily(id: UUID(), day: "Day 6", workout_In_Min: 2, trainingKind: "ブルガリアンスクワット"),
    Daily(id: UUID(), day: "Day 7", workout_In_Min: 9, trainingKind: "プランク"),
    Daily(id: UUID(), day: "Day 7", workout_In_Min: 5, trainingKind: "腕立て")
]


struct Stats : Identifiable {
    var id: Int
    var title: String
    var currentData: CGFloat
    var goal: CGFloat
    var color: Color
}

var stats_Data = [
    Stats(id: 0, title: "ブルガリアンスクワット", currentData: 6.8, goal: 15, color: .yellow),
    Stats(id: 1, title: "プランク", currentData: 3.5, goal: 5, color: .white),
    Stats(id: 2, title: "腹筋", currentData: 585, goal: 1000, color: .red),
    Stats(id: 3, title: "サイドプランク", currentData: 6.2, goal: 10, color: .orange),
    Stats(id: 4, title: "スクワット", currentData: 12.5, goal: 25, color: .blue),
    Stats(id: 5, title: "腕立て", currentData: 16889, goal: 20000, color: .green)
]

