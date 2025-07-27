# KKApexCharts

**Exploring the power and versatility of Swift Charts through practical examples and comprehensive implementations.**

This repository serves as a dedicated resource for understanding and implementing various chart types using Apple's declarative Swift Charts framework. It's designed to be a companion to a series of articles on Medium, providing runnable code for the concepts discussed.

## 🌟 Features

* **Diverse Chart Types:** Implementations covering fundamental chart visualizations.
    * **Line Charts:** Visualizing trends and continuous data.
    * **Bar Charts:** Comparing categorical data, including:
        * **Standard Bars:** Simple value comparisons.
        * **Stacked Bars:** Showing compositional data with automatic and normalized stacking (`.standard`, `.normalized`, `.center`).
        * **Grouped Bars:** Displaying multiple series side-by-side for direct comparison using `.position(by:)`.
        * **Interval Bars (Gantt-style):** Representing durations and timelines with `xStart:xEnd:y:` initializers.
* **Comprehensive Modifier Examples:** Practical demonstrations of key `Chart` and `Mark` modifiers:
    * `foregroundStyle(by:)` for data-driven coloring.
    * `annotation()` for adding labels to marks.
    * `chartXAxisLabel()` and `chartYAxisLabel()` for axis titles.
    * `chartPlotStyle()` for customizing the chart's drawing area.
    * Advanced `AxisMarks` customization (`preset: .automatic`, `.aligned`, `.extended`, `.interspersed`).
    * Controlling bar spacing using `chartXScale(range: .plotDimension(padding:))`.
* **Interactive Charts:** Examples showcasing scrollable charts and domain control:
    * `chartScrollableAxes()` for enabling scrolling.
    * `chartXVisibleDomain()` to control the visible data range.
    * `chartScrollPosition()` for setting initial scroll views.
* **Clean Data Models:** Demonstrates how to structure data (`Identifiable` conformance) for optimal use with Swift Charts.

## 🚀 Getting Started

To get a copy of the project up and running on your local machine for development and testing purposes, follow these simple steps.

### Prerequisites

* Xcode 14.0 or later (Swift Charts requires iOS 16.0+ / macOS 13.0+ / watchOS 9.0+ / tvOS 16.0+)
* macOS operating system

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/kamalkbhardwaj/KKApexCharts.git](https://github.com/kamalkbhardwaj/KKApexCharts.git)
    ```
2.  **Navigate into the project directory:**
    ```bash
    cd KKApexCharts
    ```
3.  **Open the project in Xcode:**
    ```bash
    open ChartApp.xcodeproj
    ```
4.  **Build and Run:** Select a simulator (e.g., iPhone 15 Pro Max) and run the `ChartApp` scheme.

## 🛠️ Usage

The `ChartApp` project contains various SwiftUI views, each demonstrating a different aspect or type of Swift Chart discussed in the accompanying Medium articles. Explore the `ChartApp` folder to find the SwiftUI views corresponding to specific chart examples.

Feel free to modify the data models or mark definitions to experiment with different chart configurations and data visualisations.

## ✍️ Author

* **Kamal K Bhardwaj** - [Medium](https://medium.com/@kkbhardwaj20) | [LinkedIn](https://www.linkedin.com/in/kamal-kishor-7777945a/) 

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the `LICENSE` file for details (if you plan to add one).

---
