//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/10/31.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private var count: Int = 0
    
    func bringHead() -> Element? {
        return head?.bringNodeData()
    }
    
    mutating func append(data: Element) {
        let node: Node<Element> = Node(data: data)
        if count == 0 {
            head = node
        } else {
            tail?.setupNext(node: node)
        }
        
        tail = node
        count += 1
    }
    
    mutating func removeFirst() -> Element? {
        let removedItem = head
        head = head?.bringNextNode()
        count -= 1
        return removedItem?.bringNodeData()
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    func bringListCount() -> Int {
        return count
    }
}