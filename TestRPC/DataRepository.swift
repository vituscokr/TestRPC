//
//  DataRepository.swift
//  TestRPC
//
//  Created by Gyeongtae Nam on 2022/09/22.
//

import Foundation
import GRPC

class DataRepository {
    static let shared = DataRepository()
    
    let client : Todos_TodoServiceNIOClient
    //let client: Todos_TodoServiceAsyncClient
    init() {
        let group = PlatformSupport.makeEventLoopGroup(loopCount: 1)

        do {
            let channel = try GRPCChannelPool.with(target: ConnectionTarget.hostAndPort("localhost", 1234),
                                                   transportSecurity: .plaintext,
                                                   eventLoopGroup: group)
            
            self.client =  Todos_TodoServiceNIOClient(channel: channel)
            //self.client = Todos_TodoServiceAsyncClient(channel: channel)
        } catch {
            fatalError("woops rpc setup failed")
        }
        print(self.client)
    }

    // func load() async {
    //     await client.fetchTodos(Todos_Empty())
    //
    // }


}

