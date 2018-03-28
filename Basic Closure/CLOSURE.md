# CLOSURE

## Đặt vấn đề:

Trong lập trình, không ít lần chúng ta tạo ra những function tương tác với webservice nhằm thực hiện một nhiệm vụ cụ thể nào đó. Nguyên lý của nó là gửi yêu cầu đi và nhận kết quả về. Nhưng, quá trình này sẽ diễn ra trong bao lâu? Khi nào thì nó kết thúc? Đó là điều hoàn toàn ngẫu nhiên và nó diễn ra bất đồng bộ.

Vậy làm sao để kiểm soát được quá trình này và trả về một thông báo khi nó kết thúc? Sự ra đời của `CLOSURE` sẽ giúp chúng ta giải quyết được những vấn đề trên.

## Function:

Function là một khối lệnh dùng để thực hiện một chức năng, nhiệm vụ gì đó mà người lập trình quy định. Trong ngôn ngữ Swift, function được khai báo với thừ khoá  ***func*** và chúng được phân biệt thông qua các tham số truyền vào và các giá trị trả về.

*<u>Ví dụ</u>*: Function đơn giản dưới đây có dạng `(Int) -> (Int)`

```swift
func doSometingWithInt (someInt: Int) -> Int {
	return someInt * 2
}
```

Trong trường hợp chúng ta muốn truyền một function vào một function khác như một tham số hay muốn gán một function cho một biến thì làm thế nào? Những câu hỏi này đã dẫn đến sự ra đời của ***Closure***.

## Closure:

**<u>Khái niệm</u>**: 

Theo tài liệu của Apple: ***Closure*** là một khối lệnh có thể truyền đi và sử dụng trong source code của bạn, có thể được gán cho biến hoặc truyền vào function như một tham số. Closure trong Swift tương tự như block  trong Objective-C.

Một đặc điểm quan trọng của closure là capture giá trị và lưu giữ tham chiếu đến bất cứ hằng và biến từ ngữ cảnh (context) mà nó được định nghĩa.

**<u>Cú pháp:</u>**

`{ (params) -> returnType in`
	`//statements`
`}`

> *Chú ý*: Kiểu optional của closure
>
> ((parameter) -> returnType)?

**<u>*Các dạng Closure và cách sử dụng:*</u>** Closure có một trong 3 hình thức

- Global function: Closure có tên và không capture bất kì giá trị nào. Là một function bình thường.

  ```swift
  func addTwoNumbers(number1: Int, number2: Int) -> Int {
  	return number1 + number2
  }
  addTwoNumbers(number1: 8, number2: 2) // result is 10
  ```

- Nested functions: (Các hàm lồng nhau) là Closure có tên và có thể capture giá trị khi kết thúc function.

  ```swift
  let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
  var reversed = names.sorted { (s1, s2) -> Bool in
      return s1 > s2
  }
  print(reversed)
  // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
  ```

- Closure expressions: Biểu thức Clousure không có tên, có cú pháp rút gọn và có thể capture giá trị.

  ```swift
  let closure: (Int, Int) -> Int = { (number1, number2) -> Int in
  	return number1 + number2
  }
  closure(8,2) // the result is 10
  ```

## So sánh closure với function:

***Khác nhau***:

*<u>function</u>*: 

	- Có từ khoá `func`
- Không có từ khoá `in`

<u>*closure:*</u>

- Không có từ khoá `func`
- Có từ khoá `in`

***Giống nhau***:

Function và closure đều là thành phần first-class trong Swift để chúng có thể được truyền đi và coi như một giá trị bình thường. Function và closure đều có thể:

- Gán một function/closure cho một local variable
- Thông qua function/closure như một đối số
- Trả về một function/closure

## Escaping và non-escaping trong Closure:

#### **<u>*Có hai loại closure*</u>**

**Escaping closure**: Closure được phép sử dụng giá trị trả về bên ngoài function

- Đặt từ khoá `@escaping` trước đối số truyền vào


- Truyền closure vào function
- Function chạy closure (hoặc không)
- Closure được giữ lại ngoài function bằng cách: Giữ lại trong biến hoặc chạy bất đồng bộ

**Non-escaping closure**:  

- Đặt từ khoá `@nonescape` trước đối số truyền vào hoặc để trống


- Truyền closure vào function
- Function chạy closure
- Function trả về kết quả

> Nhiều function xử lý những chức năng bất đồng bộ thường sử dụng đối số closure như một completion handler. Những function này sẽ trả về kết quả sau khi nó bắt đầu xử lý, tuy nhiên closure sẽ không được gọi cho đến khi chức năng được hoàn thành. Vì vậy closure cần phải escape để có thể được gọi lại sau.

## Autoclosures

Đặt từ khoá `@autoclosure` trước đối số trong closure giúp tự động bọc một cặp ngoặc nhọn xung quanh biểu thức trước khi nó được thông qua một function mà không gây ra lỗi. 

*Ví dụ:*

Tạo một function

```
func someName(closure: () -> Bool) {
    if closure() {
        print("TRUE")
    } else {
        print("FALSE")
    }
}
```

Sẽ không có vấn đề gì xảy  ra khi gọi function trên theo cách thông thường:

```
someName(closure: { 2 > 1 }) //TRUE
```

Nếu bỏ cặp ngoặc nhọn đi, thì có vấn đề gì xảy ra hay không? Hãy thử xem:

```
someName(closure: 2 > 1)
/*
Playground execution failed:

error: Closure.playground:8:21: error: cannot convert value of type 'Bool' to expected argument type '() -> Bool'
someName(closure: 2 > 1)
*/
```

Giờ hãy thử thêm từ khoá `@nonescape` trước cặp ngoặc () của closure khi khai báo hàm và chạy lại thử xem :D

## Tralling closure:

***<u>Khái niệm</u>***: Tralling closure là gì?

Trailing closure là một biểu thức closure có thể được viết nằm ở ngoài của cặp dấu ngoặc đơn của hàm chứa nó.

Khi một function hội đủ các yếu tố sau:

- Có tham số là một biểu thức closure.


- Tham số closure này nằm cuối cùng trong danh sách tham số của function đó.
- Biểu thức closure là tham số có phần khối lệnh dài.

Thì chúng ta có thể dùng cú pháp tralling closure cho function đó.

**<u>*Ví dụ:*</u>** Tạo một function có danh sách tham số như sau

```
func functionName(string: String, closure: () -> Void) {
    // function body
}
```

Khi gọi hàm trên ta có thể viết theo 2 cách:

```
// Cách 1:
functionName(string: "abc", closure: { () in
    // some code
})

// Cách 2:
functionName(string: "abc") { () in
    // some code
}
```



## Lời kết:

> Cuối cùng nhưng không kém phần quan trọng. Function và closure là kiểu tham chiếu. VÍ dụ dưới đây, cả `addClosure2` và `addClosure` đều tham chiếu đến cùng một closure trong bộ nhớ.

```
var addClosure:(Int,Int)->Int = { $0 + $1 }
let addClosure2 = addClosure
```

