# recipe-finder
레시피 검색 앱


## 📖 프로젝트 개요

**Recipe Finder App**은 파스타 iOS 앱 개발자 지원을 위해 간단하게 제작한 프로젝트입니다.  
최신 iOS 기술과 **클린 아키텍처**를 적용하여 코드의 유지보수성과 확장성을 고려한 구조로 개발했습니다.  
SwiftUI와 SwiftData를 활용하여 레시피를 검색하고 즐겨찾기에 저장하는 기능을 제공합니다.

---

## 🚀 주요 기능

- **레시피 검색**: 키워드를 입력하여 Spoonacular API에서 레시피를 검색.
- **레시피 즐겨찾기**: 원하는 레시피를 즐겨찾기에 추가하여 로컬 저장.
- **즐겨찾기 관리**: 저장된 레시피를 로컬에서 확인.

---

## 🛠️ 기술 스택

- **언어**: Swift
- **UI 프레임워크**: SwiftUI
- **데이터 관리**: SwiftData
- **아키텍처**: Clean Architecture
- **API**: Spoonacular API (https://spoonacular.com/food-api)

---

## 🗂️ 프로젝트 구조

프로젝트는 클린 아키텍처를 기반으로 설계되었습니다.

```yaml
RecipeFinder/
├── Entities/               # 데이터 모델
│   └── Recipe.swift
├── UseCases/               # 비즈니스 로직
│   ├── FetchRecipesUseCase.swift
│   └── SaveRecipeUseCase.swift
├── Repositories/           # 데이터 소스 관리
│   └── RecipeRepository.swift
├── InterfaceAdapters/      # ViewModel 등
│   └── RecipeListViewModel.swift
├── Views/                  # SwiftUI 뷰
│   └── RecipeListView.swift
└── App/                    # 앱 엔트리 포인트
    └── RecipeFinderApp.swift


---

## 🌟 클린 아키텍처 설계

프로젝트는 클린 아키텍처를 기반으로 각 레이어를 분리하여 구성하였습니다.

1. **Entities**: 앱의 핵심 데이터 모델 정의 (`Recipe`).
2. **Use Cases**: 비즈니스 로직 구현 (레시피 검색 및 저장).
3. **Interface Adapters**: ViewModel을 통해 뷰와 Use Case를 연결.
4. **Frameworks & Drivers**: SwiftData 및 Spoonacular API 통신.
