# How to create:

## Intro:

- provide SOP for create reusable framework
- with cocoapod and swift package manager

### SOP:

- 01 : create git repo with README and gitignore
- 02 : Xcode->File->New->Swift Package->(select repo folder)->(rename package as repo name)
- 03 : add "type: .dynamic," into package->products->.library
- 04 : in Terminal
```
swift package generate-xcodeproj
```
- 05 : open project file with Xcode
- 06 : Xcode->Scheme dropdown->Manage Schemes
- 07 : 新增一個 Scheme , Name=(package-name) , Target= (package-name)
- 08 : 新增另一個 Scheme, Name=(package-nameTests), Target= (package-nameTests)
- 09 : 刪除 Scheme name = (package-name-Package)
- 10 : 確保留下來的兩個 Scheme 都在 shared 有打勾
- 11 : move following file to "root of repo"
  - 11-1: Package.swift
  - 11-2: (package-name).xcodeproj
  - 11-3: README.md
  - 11-4: "Sources" Folder
  - 11-5: "Tests" Folder

### Usage:

- Scheme=(xxxTests), 選一個模擬器, 按 CMD + U 用來單元測試

### Deploy:

- add tag to Github Repo. Ex: 0.1.1
