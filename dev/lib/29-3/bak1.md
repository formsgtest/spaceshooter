import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'package:flame/parallax.dart';
import 'package:flame/timer.dart';
class EnemyManager extends Component with HasGameRef<SpaceShooterGame> {
  final SpaceShooterGame game;
  final List<Enemy> _enemies = [];
  final List<SuicideEnemy> _suicideEnemies = [];
  double enemyRate = 0.3;
  double enemySpeed = 200;
  double enemyCreateRate = 0.4;
  double suicideEnemyCreateRate = 0.1;
  final double suicideEnemyIncreaseScore = 100;
  EnemyManager(this.game);

  void spawnEnemy() {
    final enemy = Enemy();
    enemy.position = Vector2(
      Random().nextDouble() * game.size.x,
      0,
    );
    game.add(enemy);
    _enemies.add(enemy);
  }

  @override
  void update(double dt) {
    super.update(dt);
    enemyRate += dt;
    if (enemyRate >= enemyCreateRate) { 
      enemyRate = 0;
      spawnEnemy();
    }
  }
}

class Enemy extends SpriteComponent
    with CollisionCallbacks, HasGameRef<SpaceShooterGame> {
  final double _speed = 150;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('enemy.png');
    width = 35;
    height = 40;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(0, _speed * dt);
    if (position.y > gameRef.size.y) {
      gameRef.remove(this);
    }
  }

  @override
  void onMount() {
    super.onMount();
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }
}

class SuicideEnemy extends SpriteComponent
    with CollisionCallbacks, HasGameRef<SpaceShooterGame> {}

class SpaceShooterGame extends FlameGame
    with HasCollisionDetection, PanDetector, TapDetector {
  bool _isAlreadyLoaded = false;
  late EnemyManager _enemyManager;
  late Player _player;
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    if (!_isAlreadyLoaded) {
      camera.viewport = FixedResolutionViewport(Vector2(360, 640));
      final parallax = await loadParallaxComponent(
        [
          ParallaxImageData('stars1.png'),
        ],
        repeat: ImageRepeat.repeat,
        baseVelocity: Vector2(0, -50),
        velocityMultiplierDelta: Vector2(0, 1.5),
      );
      add(parallax);
      _player = Player();
      _enemyManager = EnemyManager(this);
      _enemyManager.spawnEnemy();
    }
    _isAlreadyLoaded = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    _enemyManager.update(dt);
  }
}

class Player extends SpriteComponent
    with CollisionCallbacks, HasGameRef<SpaceShooterGame> {}

class GameOverMenu extends StatelessWidget {
  static const String id = 'GameOverMenu';
  final SpaceShooterGame gameRef;

  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              'Game Over',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.black,
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                gameRef.overlays.remove(GameOverMenu.id);
                gameRef.resumeEngine();
              },
              child: const Text('Restart'),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                gameRef.overlays.remove(GameOverMenu.id);
                gameRef.pauseEngine();
              },
              child: const Text('Exit'),
            ),
          ),
        ],
      ),
    );
  }
}