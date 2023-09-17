//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Lee Jinhee on 2023/09/17.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = true
    var imageName: String {
        return isConnected ? "wifi" : "wifi.slash"
        
    }
    var connectionDesciption: String {
        if isConnected {
             return "Internet connection looks good"
        } else {
            return "It looks like you're not connected to the internet"
        }
    }
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
