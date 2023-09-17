//
//  ContentView.swift
//  NetworkManager
//
//  Created by Lee Jinhee on 2023/09/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            Color(.systemBlue).ignoresSafeArea()
            VStack {
                Image(systemName: networkManager.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                
                Text(networkManager.connectionDesciption)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding()
                if !networkManager.isConnected {
                    Button {
                        //Go to setting and re-enable wifi...
                        print("Handle action...")
                        
                    } label: {
                        Text("Retry")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .frame(width: 140)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
