//
//  ContentView.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/01.
//

import SwiftUI

struct ChatView: View {
    
    @State var inputText: String = ""
    
    var body: some View {
        ZStack {
            Color(.systemGray4)
                .ignoresSafeArea()
            
            // チャット部分
            ScrollView {
                VStack {
                    HStack {
                        VStack {
                            Text("こんにちは")
                        }
                        .padding()
                        .background(RoundedCorners(color: Color(.systemGray5), tl: 26, tr: 26, bl: 2, br: 26))
                        Spacer()
                    }
                    
                    HStack {
                        VStack {
                            Text("あなたの名前はなんですか？")
                        }
                        .padding()
                        .background(RoundedCorners(color: Color(.systemGray5), tl: 26, tr: 26, bl: 2, br: 26))
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        VStack {
                            Text("ハルキです。")
                        }
                        .padding()
                        .background(RoundedCorners(color: Color(.systemBrown), tl: 26, tr: 26, bl: 26, br: 2))
                    }
                }
                
            }
            .padding()
            
            // キーボード部分
            VStack {
                Spacer()
                HStack {
                    TextField("テキストを入力", text: $inputText)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                        .submitLabel(.send)
                    
                    Button {
                        
                    } label: {
                        Text("送信")
                            .foregroundColor(.white).bold()
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(Color(.systemBrown))
                            .cornerRadius(8)
                    }

                }
                .padding()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct RoundedCorners: View {
    var color: Color = .clear
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height
                
                let tr = min(min(tr, h/2), w/2)
                let tl = min(min(tl, h/2), w/2)
                let bl = min(min(bl, h/2), w/2)
                let br = min(min(br, h/2), w/2)
                
                path.move(to: CGPoint(x: w/2.0, y: 0))
                path.addLine(to: CGPoint(x: w-tr, y: 0))
                path.addArc(center: CGPoint(x: w-tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h-br))
                path.addArc(center: CGPoint(x: w-br, y: h-br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h-bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(color)
        }
    }
}
