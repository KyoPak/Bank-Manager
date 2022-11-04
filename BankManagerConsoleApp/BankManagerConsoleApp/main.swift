//
//  main.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

let bankWorker = BankWorker()
var queue = ClientQueue()
var queue2 = BankerQueue()

var bank = Bank(queue: queue, queue2: queue2, bankWorker: bankWorker)

// 얘는 왜 되지? 
//var bank2 = Bank<ClientQueue, BankerQueue>(queue: queue, queue2: queue2, bankWorker: bankWorker)

func startProcess() {
    while true {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
        
        guard let input = readLine(),
              let menu = Int(input),
              1...2 ~= menu
        else {
            print("잘못된 입력입니다.")
            continue
        }
        guard menu == 1 else { return }
        
        bank.openBank()
    }
}

startProcess()
