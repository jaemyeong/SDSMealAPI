# SDSMealAPI

SDSMealAPI 스위프트 패키지 입니다.

## Overview

삼성 SDS 식단 조회 API.

### Requirements

- macOS 12.6
- Xcode 14.0.1
- Swift 5.7

### Installation

#### Swift Package Manager

```swift
.package(url: "https://github.com/jaemyeong/SDSMealAPI.git", .upToNextMajor(from: "0.1.2"))
```

### Usage

```swift
import SDSMealAPI

let provider = SDSMealAPIProvider()

let value = await provider.fetch()
```

### Documentation

- [SDSMealAPI](https://sds-meal-api.jaemyeong.com/docs/documentation/sdsmealapi/)

### License

- [MIT](LICENSE)

### Author

[Jaemyeong Jin](https://github.com/jaemyeong) ([jaemyeong@me.com](mailto:jaemyeong@me.com))
