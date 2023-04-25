// import 'package:flame/components.dart';
// import 'enemy.dart';
// import 'game.dart';

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
