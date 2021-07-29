# Support CocoaPod :

## Note:

- currently use version = 1.10.1
- PodSpec is manifest file for Cocopods

### SOP:

- create file for you

```
pod spec create DeviceUtilKit
```

- check format validation

```
pod spec lint
```

- Register email

```
pod trunk register princejar@gmail.com 'arronpj' --description='macOS MPBY15'
```

- Upload Trunk

```
pod trunk push DeviceUtilKit.podspec
```

- RESULT:

```
--------------------------------------------------------------------------------
 🎉  Congrats

 🚀  DeviceUtilKit (0.3.2) successfully published
 📅  July 28th, 22:45
 🌎  https://cocoapods.org/pods/DeviceUtilKit
 👍  Tell your friends!
--------------------------------------------------------------------------------
```

### About Resource:

```
# spec.resources = "Resources/*.png"
```
