//
//  ClientQueue.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

struct ClientQueue: ClientQueueable {
    typealias Element = Client

    var list: LinkedList<Client> = LinkedList()
}


struct BankerQueue: BankerQueueable {
    typealias Element = BankWorker

    var list: LinkedList<BankWorker> = LinkedList()
}

