//--------------------
// Protocol (Javaでいうインタフェース)
//--------------------

// プロとコツは実装を伴わない宣言集合です。
// クラス、構造体あるいは列挙型を定義する時、プロトコルを指定して、
// そのプロトコルが宣言しているメソッドを実装します。
// ↓例

protocol Personal {
    var firstName: String { get }
    var lastName: String { get }
    init(firstName: String, lastName: String)
    func selfIntroduction() -> Void
    func speak(term: String) -> String
}

// これによって継承関係のない型でも、プロトコルで宣言された同じ機能を提供することができます。
// プロトコルに準拠しているものは、実装の質は別として、プロトコルに定義されたメソッドやプロパティは使えます。

class Citizen: Personal {
    var firstName: String
    var lastName: String
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func selfIntroduction() {
        print("こんにちは、\(self.lastName) \(self.firstName)です。")
    }

    func speak(term: String) -> String {
        return term
    }
}

// プロトコルはクラス、構造体、列挙型をで採用することが出来ますが、値型よりも参照型のデータでの実装を前提としている場合や、
// 継承を利用する場合など、クラスの実装だけを想定して、プロトコルを定義する場合があります。
// その場合は、以下のように明示的に指定します。

protocol classProtocol: class {
}

// 別のプロトコルを継承する場合、

protocol protocolTest: classProtocol {
}

// 型としてのプロトコル
// プロトコルはプログラム内で型として使うことが出来ます。
// 例としてPersonalプロトコルを型として扱うプログラムを記述することが出来ます。

func printNames(list: [Personal]) {
    for p in list {
        print("\(p.lastName) \(p.speak(term: "です"))")
    }
}