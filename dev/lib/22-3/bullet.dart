// import 'package:flame/components.dart';
// import 'package:flame/collisions.dart';
// import 'enemy.dart';
// import 'game.dart';


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

//     // if (position.y < 0) {
//     //   remove();
//     // }
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










