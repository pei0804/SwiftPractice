//--------------
// Type Method
//--------------

// https://swiftrithm.com/type-methods/
// 通常のメソッドはある特定の型（クラスなど）のインスタンスが保有するメソッドです。
// TypeMethodは型自身が保有するメソッドのことを指します。
// 型プロパティと類推で考えるとわかりやすいです。

// インスタンスメソッドはある特定の型のインスタンスから呼び出されるメソッドです。
// 型はインスタンスではなく、型そのものから呼べるメソッドです。

// 型メソッドの定義構文

// Type methodsの定義構文
struct SomeStructure {
    static var name = "some structure"
    static func typeMethod(name: String) {
        // 型メソッド内部では、selfは型そのものを指す。
        // self.nameはstatic var name
        // name は格納された引数を指す。
        print("Type property:\(self.name), パラメータ:\(name)")
    }

    static func anotherTypeMethod() {
        print("anotherTypeMethod | ", terminator:"")
        // 型メソッド内部では、型プロパティや型メソッドを使用できます。
        // その場合は、明示的に型の名前を必要としません。
        typeMethod(name: "Type method呼び出し")
    }

    // 逆に型メソッド内では、インスタンスプロパティやメソッドは呼び出すことができません
    var someInstanceVariable = "property"
    func instanceMehod() -> Int {
        return 1
    }

    static func typeMethod2() {
//        print(someInstanceVariable)
//        print(instanceMehod())
    }
}
SomeStructure.typeMethod(name: "hello")
//"Type property:some structure, パラメータ:hello"と表示
SomeStructure.anotherTypeMethod()