//----------------
// class method
//----------------
// http://qiita.com/shimesaba/items/dc976b3974cfb41bec0c

class MyClass {
    static var value = ""
    static func method() {}
}

_ = MyClass.value
MyClass.method()

// structとenumではクラスは使えない
struct MyStruct {
    static var staticProperty: String { return ""}
//    class var classProperty: String { return ""}

    static func staticMehod() {}
//    class func classMethod() {}
}

enum MyEnum {
    static var staticProperty: String { return ""}
    //    class var classProperty: String { return ""}

    static func staticMehod() {}
    //    class func classMethod() {}
}

// 型メソッド
// staticもclassも差異なく使えます

class MyClass2 {
    static func staticMethod() {}
    class func classMethod() {}
}

MyClass2.staticMethod()
MyClass2.classMethod()

// staticはオーバーライドできない

class SubClass: MyClass2 {
//    override static func staticMethod() {}
    override class func classMethod() {}
}

// クラス変数
// classはclass let classPropertyのようなStored Propertyで使うことはできない。
// Computed Propertyはどちらでもok

class MyClass3 {
    static let staticProperty = ""
//    class let classProperty = ""

    static var staticProperty2: String { return "" }
    class var classProperty2: String { return "" }
}

class MyClassToStatic {
    static var staticProperty: String { return "" }
    static func staticMethod() {}

    class func classMethod() {
        print(staticProperty)
        staticMethod()
    }
}

class MyStaticToClass {
    class var classProperty: String { return "" }
    class func classMethod() {}

    static func staticMethod() {
        print(classProperty)
        classMethod()
    }
}
