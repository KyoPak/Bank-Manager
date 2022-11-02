//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

struct Bank {
    private let bankWorker: BankWorker
    private var clientQueue: ClientQueue = ClientQueue()
    private var bankManager: BankManager = BankManager()
    
    init(bankWorker: BankWorker) {
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
