//
//  YogaWithNoahView.swift
//  FitnessApp
//
//  Created by Shawn De Alwis on 12/5/2024.
//

import SwiftUI
import AVKit

struct YogaWithNoahView: View {
    @Binding var taskCount: Int
    @State private var showVideoPlayer = false

    var body: some View {
        VStack {
            Image("workout2")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .cornerRadius(10)
                .padding()

            Text("The Path Is the Practice Flow with Jonah")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)

            Text("With Jonah")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Label("12 minutes, advanced", systemImage: "clock")
                Label("Strength, mobility, mindset", systemImage: "figure.walk")
            }
            .padding(.top, 10)
            .font(.subheadline)

            HStack {
                Label("None", systemImage: "scalemass")
                Label("Class format", systemImage: "film")
            }
            .padding(.top, 5)
            .font(.subheadline)

            Text("Every time you come to your mat, you give yourself new opportunities to explore. During this 12-minute advanced flow, Noah will guide you through movements that help you expand your breath, build your strength, and increase your mobility.")
                .padding()
                .font(.body)
                .multilineTextAlignment(.center)

            Spacer()

            Button(action: {
                taskCount += 1
                showVideoPlayer.toggle()
            }) {
                Text("Start workout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .sheet(isPresented: $showVideoPlayer) {
                YogaVideoPlayerView()
            }
            
            Spacer()
        }
        .navigationBarTitle("Yoga with Jonah", displayMode: .inline)
    }
}

struct YogaVideoPlayerView: View {
    var body: some View {
        if let videoURL = Bundle.main.url(forResource: "Video3", withExtension: "mp4") {
            let player = AVPlayer(url: videoURL)
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    player.play()
                }
        } else {
            Text("Video not found")
                .foregroundColor(.red)
        }
    }
}

struct YogaWithNoahView_Previews: PreviewProvider {
    static var previews: some View {
        YogaWithNoahView(taskCount: .constant(0))
    }
}



