# 📚 PopularReads

**PopularReads** is a SwiftUI-based iOS application that displays the **Most Popular Articles** from [The New York Times](https://developer.nytimes.com/).\
It uses the NYTimes Most Popular API to show top articles and details, and leverages `.xcconfig` files for secure environment configuration.

---

## 🚀 Features

- Browse NYT Most Popular Articles
- Clean *MVVM* structure (Model, ViewModel, View separation)
- 🌐 API layer built on **URLSession**
- 🔐 Secure config with `.xcconfig` (API Key & Base URL)
- Error handling with AppError
- Configurable environments with .xcconfig support
- Unit & UI Testing setup

---

## 📂 Project Structure

```
PopularReads
│
├── Configurations/                 # Build configurations
│   ├── Debug/
│   └── Release/
│
├── PopularReads/                   # Main app source
│   ├── App/                        # App entry point and factories
│   │   ├── PopularReadsApp.swift   # @main entry point
│   │   └── PopularArticleAPIFactory.swift
│   │
│   ├── Configuration/              # Environment & app config
│   │   └── AppConfiguration.swift
│   │
│   ├── Features/                   # Feature-based modules
│   │   └── MostPopularArticleList/
│   │       ├── Model/              # Data models
│   │       ├── NetworkLayer/       # Networking layer for feature
│   │       │   ├── API/            # Live API implementation
│   │       │   ├── MockAPI/        # Mock API for testing
│   │       │   ├── Protocols/      # API contracts/protocols
│   │       │   └── Resources/      # Networking resources
│   │       ├── View/               # SwiftUI Views
│   │       └── ViewModel/          # ViewModels for state management
│   │
│   ├── Resources/                  # App-wide resources
│   │   ├── Assets/                 # Asset catalog
│   │   ├── Info.plist              # App Info.plist
│   │   └── PopularReads (xcdatamodeld?)  # CoreData (if used)
│   │
│   └── Shared/                     # Shared modules/utilities
│       ├── AppErrors/              # Centralized error definitions
│       ├── Extensions/             # Swift extensions
│       ├── Network/                # Shared networking utils
│       ├── UIComponents/           # Reusable SwiftUI components
│       └── Utilities/              # General-purpose utilities
│
├── Tests/                          # Test targets
│   ├── UITests/                    # UI test cases
│   └── UnitTests/                  # Unit test cases
│
└── README.md                       # Project documentation

```

---

## 🚀 Getting Started

### ✅ Requirements

- Xcode 16+
- iOS 18+
- Swift 5.9+
- A valid NYTimes API Key ([Get one here](https://developer.nytimes.com/get-started))

---

## 🛠️ Tech Stack

- *SwiftUI* – Declarative UI framework
- *MVVM* – Clean architecture
- *Combine* – Data binding between ViewModel & View
- *URLSession* – Networking
- *XCTest* – Unit & UI Testing

---

## ⚙️ Configuration

This project uses *.xcconfig* files for environment setup.

1. Open `.gitignore` and ensure sensitive configs are ignored:

   - `Configuration/Debug.xcconfig`
   - `Configuration/Release.xcconfig`

2. Create or update `Debug.xcconfig` and `Release.xcconfig` as needed.

3. Provide API keys (NYT API key) in `Debug.xcconfig`:

   ```
   API_KEY = your_api_key_here
   BASE_URL = https://api.nytimes.com
   ```

4. In Xcode, set the Base Configuration for each build scheme:

   - Debug → Debug.xcconfig
   - Release → Release.xcconfig

---

### 📦 Running the App

1. Clone the Repository:

   ```bash
   git clone https://github.com/gauravrana191/popular-reads.git
   cd popular-reads
   ```

2. Open `PopularReads.xcodeproj` in Xcode.

3. Add your NYT API Key and NYT API base URL in `Configurations/Debug.xcconfig`.

4. Run on a Simulator or a physical Device.

5. Run with Mock API, You can run the app with a mocked API (no real network calls) by passing a command line argument.
     Xcode Scheme Setup
      a) Go to Xcode → Product → Scheme → Edit Scheme…
      b) Duplicate Scheme and edit name PopularReads-mocked instead of Copy of PopularReads.
      c) Now edit new scheme as you created.
      d) Select Run → Arguments Passed on Launch
         Add the following flag:
      ```diff
      -mocked
      ```
      e) Make sure before runnning app with mock "-mocked" should be available on App entry point

      ```swift
          if ProcessInfo.processInfo.arguments.contains("-mocked") {
             // Use MockAPI
         } else {
             // Use Real API
         }
      ```
## Running Tests

In Xcode:
Select scheme (e.g., PopularReads) and hit Cmd+U.
The tests will execute—check results in Test Navigator (Cmd+6) or Report Navigator (Cmd+9).

## Viewing Code Coverage

In Xcode:
Open Report Navigator (Cmd+9).
Select the latest test report.
Click the Coverage tab to view per-file and per-line coverage 
Sarunw
Codecov
.
Covered lines appear in green, while uncovered ones appear in red with execution counts

      



