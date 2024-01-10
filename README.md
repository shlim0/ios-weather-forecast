# README


## 팀원 :busts_in_silhouette: 
| 프로필 사진 | <a href="https://github.com/Dongjun-developer"><img src="https://avatars.githubusercontent.com/u/97822621?v=4" width="90" height="90"></a> | <a href="https://github.com/shlim0"><img src="https://avatars.githubusercontent.com/u/46235301?v=4" width=90></a> | 
| ---- | ---------- | --------- | 
| in Github | [@DongJun](https://github.com/ehdwns0814) | [@JJong](https://github.com/shlim0) 
| in SeSAC | 망고 | 쫑

## 프로젝트 기간 📆 
2023.11.20. ~ 2023.12.22.


## 프로젝트 핵심사항 🌟
- [x] 날씨 데이터를 API를 이용하여 JSON 데이터 파싱
- [x] `CodingKeys` 프로토콜 활용
- [x] 서버와 통신할 타입 및 네트워킹 타입 구현
- [x] `URLSession` 활용
- [x] `CoreLocation`을 활용하여 좌표, 주소 구현
- [x] `UICollectionViewCompositionalLayout` 활용한 `cell`, `header` 구현
- [x] 컬렉션 뷰 셀 이미지 지연 로딩 문제 해결을 위한 `NSCache` 활용
- [x] `UIRefreshControl`의 활용
- [x] `DateFormatter` 활용한 날짜 표현
- [x] `UIAlertController`의 `TextField` 활용
- [x] 커스텀 뷰 구현과 `StackView`, 오토레이아웃 활용
- [x] P.O.P 구조 활용
- [x] Completion Handler를 활용한 데이터 전달
- [x] 의존성 주입(DI)를 통한 테스트 가능한 구조 표현
- [x] `Error` 타입을 구현한 에러 처리 구현

## 파일구조 :file_folder:
```
WeatherForecast
├── Enums
│   ├── ImageAPI.swift
│   └── WeatherAPI.swift
├── Errors
│   ├── APIError.swift
│   ├── LocationError.swift
│   ├── NetworkError.swift
│   ├── WeatherForecastCellError.swift
│   └── WeatherForecastHeaderViewError.swift
├── Extensions
│   ├── CLLocationDegrees+Extension.swift
│   ├── DateFormatter+Extension.swift
│   └── UIImageView+Extension.swift
├── Models
│   ├── Extensions
│   │   ├── Model+Extension.swift
│   │   ├── ModelCurrentWeather+Extension.swift
│   │   └── ModelFiveDaysWeather+Extension.swift
│   └── Model.swift
├── Protocols
│   ├── KeyAuthenticatable.swift
│   ├── RequestDataTaskable.swift
│   ├── RequestSessionable.swift
│   └── Requestable.swift
├── Utilities
│   ├── Implementation
│   │   ├── CacheManager.swift
│   │   ├── LocationManager.swift
│   │   └── NetworkManager.swift
│   └── Interface
│       ├── Cacheable.swift
│       ├── Locatable.swift
│       └── Networkable.swift
├── ViewControllers
│   ├── Implementation
│   │   └── WeatherForecastViewController.swift
│   └── Interface
│       ├── AlertControllerConfigurable.swift
│       ├── UIConfigurable.swift
│       └── WeatherForecastViewControllerConfigurable.swift
└── Views
    ├── WeatherForecastCell.swift
    ├── WeatherForecastHeaderView.swift
    └── WeatherForecastView.swift
```

## 프로젝트 설명

`CoreLocation` 프레임워크를 통해 현재 위치를 가져온 뒤, 해당 위치를 기반으로 날씨 정보를 가져옵니다.
- 현재 위치를 기반으로 날씨앱이 날씨 정보를 가져옵니다.


## 실행 화면 스크린샷

| 앱 실행시 기본 UI | 앱 실행시 현 위치 날씨 정보 수신 |
|:-------:|:-------:|
| ![Simulator Screenshot - iPhone 15 Pro - 2023-12-22 at 13.17.57](https://hackmd.io/_uploads/r1MlW6zv6.png)   | ![image](https://hackmd.io/_uploads/HkJXXpGvp.png) |

| 위치 설정 | 위치 변경 | 위치 리셋  |
|:-------:|:-------:|:-------:|
| ![Simulator Screenshot - iPhone 15 Pro - 2023-12-21 at 18.44.28](https://hackmd.io/_uploads/HJjmeTzvp.png)   |![Simulator Screenshot - iPhone 15 Pro - 2023-12-21 at 18.46.59](https://hackmd.io/_uploads/BkGEeTGDp.png)   |   ![Simulator Screenshot - iPhone 15 Pro - 2023-12-21 at 18.47.39](https://hackmd.io/_uploads/S1ySNpfv6.png)|

| 특정 위치 날씨 정보 수신 | 특정 위치 날씨 정보 수신 후 초기화 | 위치 권한이 없는 경우 기본 위치 날씨 정보를 수신 |
|:-----:|:-----:|:-----:|
| ![currentLocationButton](https://github.com/tasty-code/ios-weather-forecast/assets/46235301/90f02534-7253-46f2-a286-a974fc32065d)   | ![locationChangerefresh](https://github.com/tasty-code/ios-weather-forecast/assets/46235301/0380150b-7296-4a76-b3f0-74167233d90c)   |  ![Simulator Screen Recording - iPhone 15 Pro - 2023-12-22 at 13 18 43](https://github.com/tasty-code/ios-weather-forecast/assets/46235301/18b566a4-b25b-4c9f-916a-e999ff44a817)  |


## 트러블 슈팅
https://jjong-my.notion.site/Trouble-Shooting-b1d45951c8324d69926774373f817d26?pvs=4

https://github.com/tasty-code/ios-weather-forecast/pull/25

https://github.com/tasty-code/ios-weather-forecast/pull/33

https://github.com/tasty-code/ios-weather-forecast/pull/44

https://github.com/tasty-code/ios-weather-forecast/pull/51
