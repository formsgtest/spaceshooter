除了shared_preferences在 Flutter 中還有其他可用於保存數據的庫和技術，包括：
SQLite：這是一個常用的關係型數據庫，Flutter 也提供了一個名為 sqflite 的庫，可以在移動設備上使用 SQLite。它可以用於保存較大的數據集，例如應用程序中的大量數據。
Hive：這是一個快速、輕量級的 NoSQL 數據庫，可以用於在移動設備上保存小型數據集。它的 API 簡單易用，並且支持多種數據類型。
Firebase：這是 Google 提供的一個雲數據庫服務，它提供了即時數據同步、用戶身份驗證、雲存儲等功能。Flutter 提供了一個名為 firebase_core 的庫，可以用於與 Firebase 進行集成。
JSON 文件：如果您要保存的數據比較小，可以考慮使用 JSON 文件來保存它們。Flutter 提供了一個名為 dart:convert 的庫，可以用於編解碼 JSON 數據。
這只是一些可用於在 Flutter 中保存數據的選項，具體的選擇還取決於您的需求和項目的具體情況。
