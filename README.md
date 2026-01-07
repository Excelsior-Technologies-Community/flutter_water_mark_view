# 💧 Watermark View

A simple and powerful Flutter Library to apply **Text or Image watermark** over any widget.
Supports **single** watermark and **tiled/repeated** watermark — without using CustomPainter!

---

## ✨ Features

✔ Add **text watermark**  
✔ Add **image watermark (PNG, Network, Asset)**  
✔ Show watermark **once** or **repeat (tile)**  
✔ Control **opacity, rotation, spacing, position**  
✔ Works with any widget — Image, PDF view, UI screen  
✔ **No custom painter** required  
✔ Lightweight & plug-and-play  
✔ Ideal for apps that protect screenshots or media  

---

## 📸 Preview
<p align="center">
  <img src="https://github.com/user-attachments/assets/4e9d0caf-374c-4cde-a80e-599e1b732ba1" width="45%" />
  <img src="https://github.com/user-attachments/assets/16143dc4-6659-4931-8797-db814161a8b0" width="45%" />
  <img src="https://github.com/user-attachments/assets/b75d28ce-6fff-4450-b03c-4f89b9106965" width="45%" />
  <img src="https://github.com/user-attachments/assets/db67cdfe-762e-41b3-a690-8b80c4fa54a8" width="45%" />
</p>

---

## 📦 Installation
### Add this to your `pubspec.yaml`:
```dart
dependencies:
  watermark_view:
    path: '../flutter_watermark_view/watermark_view'
```

### Using GitHub (Recommended during development)
```yaml
dependencies:
  watermark_view:
    git:
      url: https://github.com/YOUR_USERNAME/flutter_watermark_view.git
```

## 🚀 Import
```dart
import 'package:watermark_view/watermark_view.dart';
```

---

## 🚀 Usage
### 1️⃣ Text Watermark – Single
```dart
WaterMarkView(
  watermarkText: "CONFIDENTIAL",
  child: Image.network("https://picsum.photos/400"),
)
```

### 2️⃣ Text Watermark – Tiled
```dart
WaterMarkView(
  watermarkText: "DO NOT SHARE",
  mode: WatermarkMode.tiled,
  rotation: -0.4,
  opacity: 0.12,
  child: Image.network("https://picsum.photos/400"),
)
```

### 3️⃣ Image Watermark – Single (Asset)
```dart
WaterMarkView(
  type: WatermarkType.image,
  watermarkImage: const AssetImage("assets/logo.png"),
  child: Image.network("https://picsum.photos/400"),
)
```
Make sure asset is added in pubspec.yaml
```yaml
assets:
  - assets/logo.png
```


### 4️⃣ Image Watermark – Tiled (Network)
```dart
WaterMarkView(
  type: WatermarkType.image,
  mode: WatermarkMode.tiled,
  watermarkImage: NetworkImage(
    "https://pngimg.com/uploads/logo/logo_PNG2.png",
  ),
  opacity: 0.1,
  rotation: -0.4,
  imageWidth: 70,
  imageHeight: 70,
  child: Image.network("https://picsum.photos/400"),
)
```

---

## ⚙️ Parameters
| Property         | Type                | Default  | Description                      |
| ---------------- | ------------------- | -------- | -------------------------------- |
| `type`           | `WatermarkType`     | `text`   | Text or Image watermark          |
| `watermarkText`  | `String?`           | null     | Text value to draw               |
| `watermarkImage` | `ImageProvider?`    | null     | Asset or Network logo            |
| `mode`           | `WatermarkMode`     | `single` | Single or repeated               |
| `position`       | `WatermarkPosition` | `center` | Position for single mode         |
| `opacity`        | `double`            | `0.15`   | Watermark transparency           |
| `rotation`       | `double`            | `-0.4`   | Rotation angle (radians)         |
| `spacing`        | `double`            | `60`     | Horizontal spacing in tiled mode |
| `runSpacing`     | `double`            | `40`     | Vertical spacing in tiled mode   |


---

## 🎯 Supported Modes
| Mode                   | Description                |
| ---------------------- | -------------------------- |
| `WatermarkMode.single` | Only one watermark         |
| `WatermarkMode.tiled`  | Repeated watermark pattern |

---

## 🎨 Supported Types
| Type                  | Description                         |
| --------------------- | ----------------------------------- |
| `WatermarkType.text`  | Plain text watermark                |
| `WatermarkType.image` | Image watermark (PNG/Asset/Network) |

---

## 💡 Tips
✔ Use opacity between 0.08 – 0.15 for watermark effect   
✔ PNG logos with transparent background work best   
✔ For screenshots protection, use tiled mode

---

## 🏗 Project Structure
```text
lib/
├── watermark_view.dart
├── core/
│   ├── constants/
│   │   └── watermark_defaults.dart
│   ├── enums/
│   │   ├── watermark_mode.dart
│   │   ├── watermark_position.dart
│   │   └── watermark_type.dart
├── widgets/
│   └── watermark/
│       ├── watermark_view.dart
│       └── watermark_text.dart

```

---

## 📜 License
```text
Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
