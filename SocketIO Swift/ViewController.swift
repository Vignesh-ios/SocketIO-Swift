//
//  ViewController.swift
//  SocketIO Swift
//
//  Created by Kawika-Desktop on 19/01/18.
//  Copyright © 2018 Kawika. All rights reserved.
//

import UIKit
import SocketIO
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initSocket()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initSocket(){
        let manager = SocketManager(socketURL: URL(string: "http://127.0.0.1:3000/")!, config: [.log(true), .compress])
        let socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        socket.on("profile_name_changed") {data, ack in
            guard let cur = data[0] as? Double else { return }
            
//            socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in
//                socket.emit("update", ["amount": cur + 2.50])
//            }
            
            ack.with("Got your currentAmount", "dude")
        }
        
        socket.connect()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

