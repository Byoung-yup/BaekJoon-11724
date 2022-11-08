//
//  main.swift
//  BaekJoon#11724
//
//  Created by 김병엽 on 2022/11/08.
//
// Reference: https://sapjilkingios.tistory.com/106

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var visited: [Bool] = Array(repeating: false, count: input[0] + 1)
var graph: [[Int]] = Array(repeating: [], count: input[0] + 1)
var count = 0


for _ in 0..<input[1] {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[data[0]].append(data[1])
    graph[data[1]].append(data[0])
}

func dfs(_ n: Int) {
    visited[n] = true
    for i in 0..<graph[n].count {
        let next = graph[n][i]
        if !visited[next] {
            dfs(next)
        }
    }
}

for i in 1...input[0] {
    if !visited[i] {
        count += 1
        dfs(i)
    }
}

print(count)
