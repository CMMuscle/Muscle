//
//  SubDataView.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/11/30.
//

import SwiftUI
import Charts

struct SubDataView: View {
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

                    Image(trainingName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: screen.height * 0.12)

                }
                .frame(width: screen.width * 0.84, height: screen.height * 0.27)
                .padding(EdgeInsets(top: screen.height * 0.05, leading: 0, bottom: 0, trailing: 0))

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
                .padding(EdgeInsets(top: screen.height * 0.035, leading: 0, bottom: 0, trailing: 0))

                // グラフ
                ZStack {

                    RoundedRectangle(cornerRadius: 28)
                        .fill(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .frame(width: screen.width * 0.84, height: screen.height * 0.40)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                    VStack {

                        ChartView

                    }
                }
            }
//
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
}
struct SubDataView_Previews: PreviewProvider {
    static var previews: some View {
        SubDataView(trainingName: "プランク")
    }
}
