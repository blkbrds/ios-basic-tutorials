---
layout: post

title: Optional trong Swift
---

Trong lập trình, một trong những lỗi thường gặp nhất của lập trình viên là dùng một biến nhưng không kiểm soát được giá trị trả về của biến, biến đó có thể có giá trị (**value**) hoặc không có giá trị nào (**no value**).

Vấn đề đặt ra ở đây là có quá nhiều trường hợp có thể làm cho giá trị của biến không tồn tại, và sử dụng những biến như vậy tiềm ẩn rất nhiều mối nguy hiểm. Câu hỏi đặt ra ở đây là cần giải quyết vấn đề đó như thế nào?

Trên thực tế thì các lập trình viên cũng đã đưa ra nhiều giải pháp để giải quyết vấn đề trên. Nhưng ở bài viết này, mình sẽ phân tích kỹ hơn về một kiểu dữ liệu dùng để chấp nhận sự vắng mặt giá trị của một biến / hằng.

Mời các bạn tìm cùng mình đi sâu hơn một chút về *kiểu dữ liệu Optional* trong **Swift**.

## Kiểu dữ liệu Optional

Trong Swift có một giá trị đặc biệt là `nil`, xác định trạng thái không có giá trị của biến / hằng. `nil` có thể gây ra các lỗi về xử lý, ví dụ như thực hiện các phép toán giữa các biến có giá trị `nil` với nhau có thể gây lỗi.

Khi sử dụng các biến / hằng mà ta không chắc chắn nó có giá trị hay không, để an toàn thì ta sẽ gói (**wrap**) nó lại (các giá trị này là `wrapped value`)

Như vậy:

- **Optional** là kiểu đại diện cho hoặc là `wrapped value` hoặc là `nil`.


- **Optional** thực chất là một kiểu dữ liệu, nhưng nó gắn liền với các kiểu dữ liệu có sẵn và kèm theo ký pháp `?`


- Cú pháp:

```swift
var <name>: <Type>?
// or
let <name>: <Type>?
```

- Chú ý:

  > - Biến / hằng **Optional** có thể có giá trị hoặc không có lúc khởi tạo
  > - Sử dụng `nil` để xác định trạng thái không có giá trị của biến / hằng
  > - Chỉ có thể gán `nil` cho biến / hằng **Optional**

<u>Ví dụ:</u>

```swift
var originalString: String = "Can't nil"
var optionalString: String? = "Can nil"

originalString = nil	// Error: Nil cannot be assigned to type 'String'
optionalString = nil	
```

## Unwrapping Optional

Khi khai báo một biến kiểu **Optional** (tức đã gói lại), thì khi muốn sử dụng nó, ta phải mở gói ra (**unwrap**).

Các phương pháp **unwrapped optional**:

### ***Force unwrapping***:

Sử dụng toán tử `! ` (*forced unwrapping operator*) sau biến **Optional**

<u>Ví dụ:</u>

```swift
struct Person {
    let middleName: String?
    let lastName: String
    var displayName: String {
        return middleName + " " + lastName
    }
}
// Error: Value of optional type 'String?' not unwrapped; did you mean to use '!' or '?'?
```

Nếu chúng ta không ***Force unwrapping*** thì sẽ nhận được lỗi như trên

Khi thêm `!` vào sau biến `middleName`, thông báo lỗi sẽ mất:

```swift
struct Person {
    let middleName: String?
    let lastName: String
    var displayName: String {
        return middleName! + " " + lastName
    }
}
```

Tuy nhiên, chúng ta không thể chắc chắn giá trị của biến sẽ không mang giá trị `nil`. Và nếu cố gắng ***forced unwrapping*** một giá trị `nil` thì sẽ gây ra **runtime exception** (*Unexpectedly found nil while unwrapping an Optional value*) và gây **crash app**. Do đó cách tiếp cận này không được khuyến nghị.

Để giải quyết vấn đề trên thì chúng ta có thể làm theo một cách đơn giản, đó là đặt điều kiện cho thuộc tính `middleName`:

```swift
struct Person {
    let middleName: String?
    let lastName: String
    var displayName: String {
        if middleName != nil {
            return middleName + " " + lastName
        }
        return lastName
    }
}
```
Như ở trên, chúng ta đã an tâm hơn khi đặt điều kiện khi sử dụng biến **Optional**. Nhưng giả sử, thao tác đặt điều kiện này xảy ra nhiều lần, thì cách làm sẽ khá rườm rà và bất tiện. Thật may Swift đã cung cấp cho ta 2 công cụ tuyệt vời để đảm bảo sự an toàn cho app. Và sử dụng 2 công cụ này cũng là một cách để ***Force unwrapping***.

### ***Optional binding***:

Sử dụng `if let` (hoặc `if var`) - `guard let` (hoặc `guard var`) để kiểm tra nếu như biến có giá trị thì ***unwrap*** và sử dụng giá trị của biến trong phạm vi hàm `if` (ngoài phạm vi hàm `guard`), nếu không thì thôi.

Cách này giúp chúng ta không phải sử dụng `!` lặp đi lặp lại như khi dùng ***forced unwrapping***.

<u>Ví dụ</u>

```swift
struct Person {
    let middleName: String?
    let lastName: String
    var displayName: String {
        if let middleName = middleName {
            return middleName + " " + lastName
        }
        return lastName
    }
}
```

Cách này có thể dùng ***binding*** nhiều giá trị trong trường hợp chúng ta cần kiểm tra biến Optional nhiều lần:

```swift
struct Person {
    let firstName: String?
    let middleName: String?
    let lastName: String
    var displayName: String {
        if let firstName = firstName, let middleName = middleName {
            return firstName + " " + middleName + " " + lastName
        }
        return lastName
    }
}
```

<u>Lưu ý:</u>

- Quá trình ***Optional binding*** tạo ra một hằng số mới ánh xạ từ giá trị cũ trong thân 			hàm `if` (ngoài thân hàm `guard`), vậy nên ta có thể sử dụng lại tên biến cũ.
- Cách làm này an toàn hơn vì biến được kiểm tra trước khi sử dụng, tránh các trường hợp crash chương trình.

Ngoài ra, chúng ta có 1 cách nữa để **Force unwrapping**:

### ***Implicitly Unwrapped Optional*** (hay ***Automatic Unwrapping***):

Tức là ***Force unwrapping*** ngay lúc khởi tạo biến Optional. Và sau này dùng biến đó thì sẽ không cần phải ***Force unwrapping*** biến đó nữa.

<u>Ví dụ:</u>

```swift
struct Person {
    let middleName: String!
    let lastName: String
    var displayName: String {
        return middleName + " " + lastName
    }
}
```

<u>Lưu ý:</u>

Bản chất của cách làm này là bỏ đi toán tử `!` mỗi lần sử dụng biến. Vậy hãy chắc chắn 100% biến **Optional** khai báo là không nil trước khi ***Implicitly Unwrapped Optional***

## Nil coalescing

Đây là cách để phòng hờ lỗi khi dùng biến kiểu **Optional**. 

Cách dùng như sau:

```swift
<optionalVariable> ?? <Default Value>
```

<u>Ví dụ:</u>

```swift
var middleName: String?
print(middleName ?? "Swift 4")
```

Giả sử như biến `middleName` bị `nil`, thì nó sẽ được gán giá trị mặc định là "*Swift 4*"

## Lời kết

- **Optional** là một khái niệm trong *Swift* dùng để xử lý việc biến không có giá trị. Khai báo biến dạng **Optional** bằng cách thêm `?` vào sau kiểu dữ liệu của biến. Và nên dùng **Optional binding** để lấy giá trị của biến **Optional**.
- Trong bài viết có nhắc đến `if let` và `guard let`, về 2 công cụ này đã có một bài viết khá rõ ràng rồi, các bạn có thể đọc để hiểu hơn về chúng.

Hy vọng sau bài viết này, các bạn sẽ hiểu rõ hơn về bản chất cũng như cách sử dụng kiểu dữ liệu **Optional** để khỏi lúng túng cũng như linh hoạt hơn trong việc xây dựng ứng dụng của mình!