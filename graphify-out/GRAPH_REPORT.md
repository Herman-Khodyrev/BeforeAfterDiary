# Graph Report - .  (2026-09-13)

## Corpus Check
- Corpus is ~606 words - fits in a single context window. You may not need a graph.

## Summary
- 29 nodes · 34 edges · 6 communities (3 shown, 3 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Application Lifecycle
- App Bootstrap
- Scene Lifecycle
- Scene State Events
- Initial Screen
- Scene Configuration

## God Nodes (most connected - your core abstractions)
1. `SceneDelegate` - 10 edges
2. `AppDelegate` - 4 edges
3. `UIKit` - 3 edges
4. `ViewController` - 3 edges

## Surprising Connections (you probably didn't know these)
- `SceneDelegate` --inherits--> `UIResponder`  [EXTRACTED]
  AfterMedia/SceneDelegate.swift →   _Bridges community 1 → community 2_

## Import Cycles
- None detected.

## Communities (6 total, 3 thin omitted)

### Community 0 - "Application Lifecycle"
Cohesion: 0.25
Nodes (7): UIScene, UISceneSession, Any, Bool, Set, UIApplication, UISceneConfiguration

### Community 1 - "App Bootstrap"
Cohesion: 0.33
Nodes (4): AppDelegate, UIApplicationDelegate, UIKit, UIResponder

### Community 2 - "Scene Lifecycle"
Cohesion: 0.40
Nodes (3): SceneDelegate, UIWindow, UIWindowSceneDelegate

## Knowledge Gaps
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `SceneDelegate` connect `Scene Lifecycle` to `App Bootstrap`, `Scene State Events`, `Scene Configuration`?**
  _High betweenness centrality (0.570) - this node is a cross-community bridge._
- **Why does `AppDelegate` connect `App Bootstrap` to `Application Lifecycle`?**
  _High betweenness centrality (0.497) - this node is a cross-community bridge._
- **Why does `UIKit` connect `App Bootstrap` to `Initial Screen`?**
  _High betweenness centrality (0.284) - this node is a cross-community bridge._