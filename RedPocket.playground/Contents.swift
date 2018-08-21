import Foundation

struct LeftMoneyPackage {
    var remainSize: Int
    var remainMoney: Double
}

func getRandomMoney( left: inout LeftMoneyPackage) -> Double {
    if (left.remainSize == 1) {
        left.remainSize = left.remainSize - 1
        return Double((round(left.remainMoney * 100) / 100))
    }
    
    let max = left.remainMoney / Double(left.remainSize) * 2
    let money = Double.random(in:0.01...max)
    left.remainMoney <= 0.01 ? 0.01 : money
    left.remainSize -= 1
    left.remainMoney = left.remainMoney - money
    return Double(round(100*money)/100)
}

var left = LeftMoneyPackage(remainSize: 5, remainMoney: 10)
for i in 1...5  {
    let returnM = getRandomMoney(left: &left)
    print("第\(i)个人抢到\(returnM), 剩余\(left.remainSize)个红包, 剩余\(left.remainMoney)元")
}
