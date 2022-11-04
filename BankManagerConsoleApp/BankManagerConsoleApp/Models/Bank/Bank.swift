//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

struct Bank<Element: ClientQueueable, Element2: BankerQueueable> {
    private let bankWorker: BankWorker
    private var clientQueue: Element
    private var bankerQueue: Element2
    private var bankManager: BankManager = BankManager()
    
    init(queue: Element, queue2: Element2, bankWorker: BankWorker) {
        self.clientQueue = queue
        self.bankerQueue = queue2
        self.bankWorker = bankWorker
    }
    
    mutating func openBank() {
        updateClientQueue()
        startBankWork()
        endBankWork()
    }
    
    mutating private func updateClientQueue() {
        for number in 1...Int.random(in: 10...30) {
            clientQueue.enqueue(Client(waitingTicket: number))
            bankManager.addClientCount()
        }
    }
    
    mutating private func startBankWork() {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            bankManager.resetWorkTime()
            bankWorker.startWork(client: client)
            bankManager.addWorkTime()
        }
    }
    
    mutating private func endBankWork() {
        bankManager.printWorkFinished()
    }
}
