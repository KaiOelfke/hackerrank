//https://www.hackerrank.com/challenges/minimum-time-required/problem
import Foundation

// Complete the minTime function below.
func minTime(machines: [Int64], goal: Int64) -> Int64 {
  var machineCount: [Int64: Int64] = Dictionary(minimumCapacity: machines.count)
  for machine in machines {
    machineCount[machine] = (machineCount[machine] ?? 0) + 1
  }
  var days = machineCount.keys.sorted()
  var i: Int64 = 1
  var sum: Int64 = 0
  while sum < goal && i <= 18 {
    sum = outputAtDay(Int64(pow(Double(10), Double(i))), machineCount: machineCount, days: days)
    i += 1
  }
  if sum == goal {
    return Int64(pow(Double(10), Double(i-1)))
  }
  var l = Int64(pow(Double(10), Double(i-2)))
  var r = Int64(pow(Double(10), Double(i-1)))
  while r - l > 1 {
    var p = (l+r) / 2 
    sum = outputAtDay(p, machineCount: machineCount, days: days)
    if sum >= goal {
      r = p
    } else if sum < goal {
      l = p
    }
  }
  return r
}

func outputAtDay(_ day: Int64, machineCount: [Int64: Int64], days: [Int64]) -> Int64 {
  var sum: Int64 = 0
  for d in days {
    if d > day {
      break
    }
    sum += machineCount[d]! * (day / d)
  }
  return sum
}

/*
Erstelle dict[day] = maschineCount, Anzahl maschinen die day Tage brauchen O(n)
Erstelle array keys (days), sortiert O(d log d) d<=n
i = 1
while sum < goal, i < 9 sonst overflow mit 32 bit int
  sum = 0
  Berechne output nach 10^i days mit
  for d in days: O(d)
    wenn d > 10^i:
      break
    sum += (10^i / d) * dict[day] (zb 10 tage / 3 tage => 3 iterationen) * 4 maschinen
  i += 1  
nun sum >= goal
wenn sum == goal
  return 10^i
antwort liegt zwischen 10^(i-2) und 10^(i-1)
binary search
l = 10^(i-2)
r = 10^(i-1)
while r-l > 1 //solange es noch mehr als 1 tage unterschied gibt
  p = (l+r) / 2 achtung overflow
  berechne output(p)
  wenn output > goal:
    r = p
  wenn output < goal:
    l = p
  wenn output == goal:
    return p
return r
*/

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nGoalTemp = readLine() else { fatalError("Bad input") }
let nGoal = nGoalTemp.split(separator: " ").map{ String($0) }

guard let n = Int64(nGoal[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let goal = Int64(nGoal[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let machinesTemp = readLine() else { fatalError("Bad input") }
let machines: [Int64] = machinesTemp.split(separator: " ").map {
    if let machinesItem = Int64($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return machinesItem
    } else { fatalError("Bad input") }
}

guard machines.count == n else { fatalError("Bad input") }

let ans = minTime(machines: machines, goal: goal)

fileHandle.write(String(ans).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
