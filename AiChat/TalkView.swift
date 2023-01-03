//
//  TalkView.swift
//  AiChat
//
//  Created by 古賀遥貴 on 2023/01/01.
//

import SwiftUI
import Speech
import AVFoundation

struct TalkView: View {
    
    @ObservedObject private var speechRecorder = SpeechRecorder()
    @State private var showingAlert = false
    
    var chats: [Chat] = [
        Chat(isSentByUser: true, text: "こんにちは"),
        Chat(isSentByUser: true, text: "あなたの名前はなんですか？"),
        Chat(isSentByUser: false, text: "Meboです。😄")
    ]
    
    var body: some View {
        
        ZStack {
            Color(.systemGray4)
                .ignoresSafeArea()
            
            // チャット部分
            ScrollView {
                VStack {
                    
                    ForEach(chats) { remark in
                        
                        if remark.isSentByUser {
                            HStack {
                                Spacer()
                                VStack {
                                    Text(remark.text)
                                }
                                .padding()
                                .background(RoundedCorners(color: Color(.systemBrown), tl: 26, tr: 26, bl: 26, br: 2))
                            }
                        } else {
                            HStack {
                                VStack {
                                    Text(remark.text)
                                }
                                .padding()
                                .background(RoundedCorners(color: Color(.systemGray5), tl: 26, tr: 26, bl: 2, br: 26))
                                Spacer()
                            }
                        }
                        
                    }
                }
                
            }
            .padding()
            
            // マイク部分
            VStack {
                Spacer()
                
                if speechRecorder.audioRunning {
                    Text(speechRecorder.audioText)
                        .padding()
                        .background(
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .foregroundColor(Color(.systemGray5))
                                .frame(minWidth: 250)
                        )
                        .padding(.bottom)
                }
                
                Button {
                    speechRecorder.audioRunning.toggle()
                    
                    if(AVCaptureDevice.authorizationStatus(for: AVMediaType.audio) == .authorized &&
                       SFSpeechRecognizer.authorizationStatus() == .authorized){
                        showingAlert = false
                        speechRecorder.toggleRecording()
                        if speechRecorder.audioRunning {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                
                            }
                        }
                    }
                    else{
                        showingAlert = true
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(speechRecorder.audioRunning ? Color(.systemBrown) : Color(.systemBackground))
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(.systemBrown), lineWidth: 7)
                            )
                        
                        Image(systemName: speechRecorder.audioRunning ? "mic.fill" : "mic")
                            .font(.title3.bold())
                            .foregroundColor(speechRecorder.audioRunning ? Color(.label) : Color(.systemGray))
                    }
                    .frame(width: 80, height: 80)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("マイクの使用または音声の認識が許可されていません"))
                }
            }
            .padding()
            .padding(.bottom)
            
        }
        .onAppear{
            // マイク使用許可申請
            AVCaptureDevice.requestAccess(for: AVMediaType.audio) { granted in
                OperationQueue.main.addOperation {
                    
                }
            }
            // 音声認識使用許可申請
            SFSpeechRecognizer.requestAuthorization { status in
                OperationQueue.main.addOperation {
                }
            }
        }
        
    }
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView()
    }
}
