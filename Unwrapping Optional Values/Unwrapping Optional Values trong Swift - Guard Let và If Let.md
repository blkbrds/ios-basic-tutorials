# Unwrapping Optional Values trong Swift - Guard Let và If Let?

Swift hỗ trợ cho chúng ta nhiều cách để unwrap 1 biến Optional, như sử dụng toán tử "!" là phương pháp `force unwrapped` hoặc dùng câu lệnh `if let` và `guard let`. Nhưng tuỳ trường hợp chúng ta sẽ sử dụng 1 trong 3 cách đó.

## Force Unwrapped:

Chúng ta có thể unwrap 1 biến Optional với toán tử `!` nhưng đó không phải là cách wrapping an toàn. Nếu bạn dùng `forcibly unwrapping` không đúng chỗ, ứng dụng có thể bị crashed.

```swift
var name: String? = "Dung Duong C."

print(name!) // Dùng toán tử "!" để unwrap một giá trị Optional
// Kết quả in ra: Dung Duong C.
```

Khi sử dụng cách làm này, phải luôn chắc chắn rằng biến có values, nếu không sẽ gây crash chương trình (`run time error: fatal error: unexpectedly found nil while unwrapping an Optional value`)

## Optional Binding:

Vì vậy bạn có thể unwrap 1 biến Optional với `if let` (`Optional Binding`). Sử dụng `if let` để kiểm tra nếu như biến có giá trị thì unwrap và sử dụng giá trị của biến, nếu không thì thôi, ví dụ:

```swift
var name: String? = "Dung Duong C."
var nilString: String? = nil

if let fullName = name {
// Dùng let bởi vì chúng ta không cần thay đổi giá trị của fullName
    print(fullName)
}

if let notHaveValue = nilString { 
// nilString là nil, vì vậy khối code này sẽ không chạy
    print("Hello")
} else {
    print("Nothing to say")
}
// Kết quả: Nothing to say
```

Cách làm này an toàn hơn vì luôn đảm bảo biến có được kiểm tra xem có giá trị hay không trước khi sử dụng, tránh các trường hợp crash chương trình. Tuy nhiên, biến được unwrapped bởi `if let` chỉ được sử dụng trong phạm vi của khối câu lệnh if.

## Guard:

Bên cạnh `if let` thì cũng có thể unwrap 1 biến Optional với `guard`.

```swift
let name : String? = "Dung Duong C."
let age: Int? = 22

func person(_ name: String?, _ age: Int?) {
    guard let name = name, let age = age else {
        print("Nothing to show")
        return
    }
    print(name)
    print(age)
}

person(name, age)
```

`Guard` cũng gần giống như `if let` (`optional binding`), nó cũng được sử dụng để xử lý các đối tượng dạng Optionals, cũng kiểm tra các điều kiện khác `nil` thì cho phép thực hiện các logic tiếp theo... Nhưng `guard` còn được gọi với tên gọi là "Early Exit", vậy `guard` khác với `if let` ở điểm nào?

```swift
let name : String? = "Dung Duong C."
let email: String? = nil

func checkPersonWithOptionalBinding(_ name: String?) {
    // Dùng optional binding để kiểm tra nếu đối tượng không nil
    if let fullName = name {
        // Nếu không nil, tiếp tục logic
        print("Hi \(fullName)")
    } else {
        // Nếu nil, in ra lỗi hoặc không có gì để show ra...
        print("Nothing to show")
    }
}

func checkPersonWithGuard(name: String?) {
    // Kiểm tra nếu đối tượng nil sau đó thực hiện logic của trường hợp nil đầu tiên
    guard let fullName = name else {
        // Câu lệnh Guard dùng khi chúng ta cần chú ý đến trường hợp: đối tượng nil đầu tiên
        // Hoặc thực hiện logic khi điều kiện chưa thoả mãn
        print("Nothing to show")
        return
    }
    // Nếu đối tượng không nil, sau đó thực hiện logic
    print("Hi \(fullName)")
}

checkPersonWithOptionalBinding(name)
checkPersonWithOptionalBinding(email)


checkPersonWithGuard(name: name)
checkPersonWithGuard(name: email)
```

Ví dụ trên là sự so sánh giữa việc sử dụng `if let` và `guard` để xử lý việc kiểm tra đối tượng có thoả mãn điều kiện là khác "nil" hay không.

Với `if let` thì ta tập trung xử lý trường hợp có giá trị trước. Còn `guard` thì ta ưu tiên xử lý trường hợp không có value trước. Hai khái niệm trên cùng xử lý việc tương tự nhau, nhưng tuỳ hoàn cảnh cụ thể mà ta dùng `if let` hay "guard" cho phù hợp.

Tất nhiên là `guard` còn được sử dụng để kiểm tra hàng loạt các điều kiện khác nhau (không nhất thiết chỉ là kiểm tra nil) xem các điều kiện có cùng thoả mãn hay không.

Có một điều cần chú ý là, với câu lệnh  `guard`  thì trong trường hợp `else` , ta bắt buộc phải return. Và sử dụng `guard` một cách hợp lý sẽ làm source code dễ đọc hơn, dễ maintain hơn.