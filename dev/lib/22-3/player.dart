// import 'package:flame/components.dart';
// import 'package:flame/collisions.dart';
// import 'bullet.dart';
// import 'enemy.dart';
// import 'game.dart';

// class Player extends SpriteComponent
//     with CollisionCallbacks, HasGameRef<SpaceShooterGame> {
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
// }
