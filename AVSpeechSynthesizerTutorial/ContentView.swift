import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    let textToSpeak = "こんにちは、世界！これは音声合成のサンプルです。"

    var body: some View {
        VStack {
            Text(textToSpeak)
                .padding()
            
            Button(action: {
                speakText()
            }) {
                Text("読み上げる")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    func speakText() {
        let utterance = AVSpeechUtterance(string: textToSpeak)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.rate = 0.5
        speechSynthesizer.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
