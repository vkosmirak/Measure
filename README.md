# Measure
Simple way to measure duration of function in Swift

### Log:
```
Measure: 1.0072 (MyPlayground sleep() line 35)`
```

### Installation:

Drag & drop `Measure.swift` into project


## How to use


### 1. Function

```swift
voidFunction()
```

<img src="https://png.icons8.com/ios/1600/down.png" width="50" hspace="50">

```swift
measure {
    voidFunction()
}
```

### 2. Function with return value

```swift
let users = Users.loadFromDatabase()
```

<img src="https://png.icons8.com/ios/1600/down.png" width="50" hspace="50">

```swift
let users = measure { Users.loadFromDatabase() }
```

### 3. Function with throwing error

```swift
let user = try JSONDecoder().decode(User.self, from: json)
```

<img src="https://png.icons8.com/ios/1600/down.png" width="50" hspace="50">

```swift
let user = try measure { try JSONDecoder().decode(User.self, from: json) }
```

### 4. Named measuring

```swift
voidFunction()
```

<img src="https://png.icons8.com/ios/1600/down.png" width="50" hspace="50">

```swift
measure("Just function") {
    voidFunction()
}
```


### TODO: 

1. Return value, not just print it
2. Prettify workspace
3. Complete readme
