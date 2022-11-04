//
//  Clientable.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/03.
//

import Foundation

protocol ClientQueueable: Queueable where Element == Client { }

protocol BankerQueueable: Queueable where Element == BankWorker { }
