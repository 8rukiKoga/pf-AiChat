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
    
    @State var inputType: InputType = InputType.mic
    @State var inputText: String = ""
    
    var chats: [Chat] = [
        Chat(isSentByUser: true, text: "こんにちは"),
        Chat(isSentByUser: true, text: "あなたの名前はなんですか？"),
        Chat(isSentByUser: false, text: "Meboです。😄")
    ]
    
    var body: some View {
        
        ZStack {
            Color(.systemGray4)
                .ignoresSafeArea()
            
            VStack {
                // ピッカー部分
                VStack {
                    Picker("", selection: $inputType) {
                        ForEach(InputType.allCases, id: \.self) { value in
                            Text("\(value.rawValue)").tag(value)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }
                .padding(.top)
                
                // チャットフィード部分
                ChatFeedView(chats: chats)
            }
            
            VStack {
                Spacer()
                
                if inputType == .mic {
                    
                    // マイク部分
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
                    
                } else {
                    
                    // キーボード部分
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
                    
                }
            }
            .padding()
            
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

enum InputType: String, CaseIterable {
    case mic = "マイク"
    case keyboard = "キーボード"
}
