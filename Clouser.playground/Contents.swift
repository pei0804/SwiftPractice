//-------------
// Clouser
//-------------

//----------基本的な使い方----------
// (Void) -> Voidという型の関数
func greet(_: Void) -> Void {
    print("こんにちは")
}

// fooという引数で、(Void) -> Voidの型の関数を受け取る
func test(foo: (_: Void) -> Void) -> Void {
    foo()
}

// 実際に使ってみる
test(foo: greet)

//----------同じ型の関数を使いまわす----------
let add = {(atai1: Int, atai2: Int) -> Int in
    return atai1 + atai2
}

let sub = {(atai1: Int, atai2: Int) -> Int in
    return atai1 - atai2
}

func calculator(type: (Int, Int) -> Int) {
    type(1, 2)
}

calculator(type: add)
calculator(type: sub)

func isBig<T: Comparable>(atai1: T, atai2: T) -> Bool {
    return atai1 > atai2
}

func test2(atai1: Int, atai2: Int,isBig: (Int, Int) -> Bool) -> Bool {
    return isBig(atai1, atai2)
}

test2(atai1: 1, atai2: 2, isBig: isBig)

//----------map----------
// http://qiita.com/merrill/items/b3a57acf38afdd3023f0
// http://swift.tecc0.com/?p=249
// 各配列内の各要素をループで取り出して、処理をする
// map { (a: "配列要素の型") -> "処理内容の返り値の型" in "処理内容" }
let arrayMap = [1, 2, 3, 4, 5].map{(a: Int) -> Int in
    a * 2
}

let arrayMap2 = [1, 2, 3, 4, 5].map{ $0 * 2}

//----------filter----------
let arrayFilter = [1, 2, 3, 4, 5].filter{(a: Int) -> Bool in
    return a > 1
}

let arrayFilter2 = [1, 2, 3, 4, 5].filter{$0 > 2}
print(arrayFilter2)

//----------reduce----------
let arrayReduce = [1, 2, 3, 4, 5].reduce(0){(ans, num) -> Int in
    ans + num
}
print(arrayReduce)
let arrayReduce2 = [1, 2, 3, 4, 5].reduce(0, {$0 + $1})

//----------応用----------
// 絞込して、全てに掛け算して、足し算する
let arrayMapFilter = [1, 2 ,3, 4, 5].filter{$0 > 2}.map{$0 * 2}.reduce(0, {$0 + $1})
print(arrayMapFilter)
