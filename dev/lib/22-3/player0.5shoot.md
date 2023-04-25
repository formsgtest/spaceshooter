// import 'dart:math';

// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/game.dart';
// import 'package:flutter/material.dart';
// import 'package:flame/collisions.dart';

// class SpaceShooterGame extends FlameGame
//     with HasCollisionDetection, PanDetector, TapDetector {
//   late Player player;
//   late Bullet bullet;
//   late Enemy enemy;
//   late EnemyManager enemyManager;

//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();

//     player = Player();
//     bullet = Bullet();
//     enemy = Enemy();
//     add(enemy);
//     add(bullet);
//     add(player);
//     enemyManager = EnemyManager();
//     add(enemyManager);
//   }

//   @override
//   void onPanUpdate(DragUpdateInfo info) {
//     player.move(info.delta.game);
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//   }
// }

// //创建子弹组件
// class Bullet extends SpriteComponent
//     with CollisionCallbacks, HasGameRef<SpaceShooterGame> {
//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();

//     sprite = await gameRef.loadSprite('ship_B.png');

//     width = 10;
//     height = 10;
//     anchor = Anchor.center;
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);

//     position.add(Vector2(0, -100 * dt));

//     if (position.y < 0) {
//       gameRef.remove(this);
//     }
//   }

//   @override
//   void onMount() {
//     super.onMount();

//     final shape = CircleHitbox.relative(
//       0.8,
//       parentSize: size,
//       position: size / 2,
//       anchor: Anchor.center,
//     );
//     add(shape);
//   }

//   @override
//   void onCollision(Set<Vector2> points, PositionComponent other) {
//     super.onCollision(points, other);
//     //一个子弹只能打中一个敌人
//     if (other is Enemy) {
//       gameRef.remove(other);
//       gameRef.remove(this);
//     }
//   }
// }

// class Player extends SpriteComponent
//     with CollisionCallbacks, HasGameRef<SpaceShooterGame> {
//   //發射子彈的間隔時間
//   double shootRate = 0.5;

//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();
//     sprite = await gameRef.loadSprite('ship_H.png');
//     position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
//     width = 60;
//     height = 70;
//     anchor = Anchor.center;
//   }

// //创建射击方法
//   void shoot() {
//     final bullet = Bullet();
//     bullet.position = position;
//     gameRef.add(bullet);
//   }

//   void move(Vector2 delta) {
//     position.add(delta);
//   }

//   @override
//   void onCollision(Set<Vector2> points, PositionComponent other) {
//     super.onCollision(points, other);
//     if (other is Enemy) {
//       // gameRef.remove(other);
//     }
//   }

//   @override
//   void onMount() {
//     super.onMount();

//     final shape = CircleHitbox.relative(
//       0.8,
//       parentSize: size,
//       position: size / 2,
//       anchor: Anchor.center,
//     );
//     add(shape);
//   }

//   //玩家每0.5秒射击
//   @override
//   void update(double dt) {
//     super.update(dt);
//     shootRate -= dt;
//     if (shootRate <= 0) {
//       shootRate = 0.5;
//       shoot();
//     }
//   }
// }

// //创建敌人组件
// class Enemy extends SpriteComponent
//     with CollisionCallbacks, HasGameRef<SpaceShooterGame> {
//   @override
//   Future<void> onLoad() async {
//     await super.onLoad();
//     sprite = await gameRef.loadSprite('ship_E.png');
//     position = Vector2(gameRef.size.x / 2, 0);
//     width = 60;
//     height = 70;
//     anchor = Anchor.center;
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     position.add(Vector2(0, 100 * dt));
//   }

//   @override
//   void onCollision(Set<Vector2> points, PositionComponent other) {
//     super.onCollision(points, other);
//     if (other is Player) {
//       // gameRef.remove(other);
//     }
//   }

//   @override
//   void onMount() {
//     super.onMount();
//     final shape = CircleHitbox.relative(
//       0.8,
//       parentSize: size,
//       position: size / 2,
//       anchor: Anchor.center,
//     );
//     add(shape);
//   }
// }

// //创建管理敌人的组件
// class EnemyManager extends Component with HasGameRef<SpaceShooterGame> {
//   //enemy spawn rate in seconds
//   double spawnRate = 3.0;
//   //enemy speed
//   double enemySpeed = 100.0;

//   @override
//   void update(double dt) {
//     super.update(dt);

//     spawnRate -= dt;
//     if (spawnRate <= 0) {
//       spawnRate = 3.0;
//       final enemy = Enemy();
//       gameRef.add(enemy);
//     }
//   }
// }
