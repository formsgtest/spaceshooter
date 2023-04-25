//创建敌人组件
class Enemy extends SpriteComponent
    with CollisionCallbacks, HasGameRef<SpaceShooterGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('ship_E.png');
    // position = Vector2(gameRef.size.x / 2, 0);
    width = 60;
    height = 70;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(Vector2(0, 100 * dt));
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

//创建管理敌人的组件
class EnemyManager extends Component with HasGameRef<SpaceShooterGame> {
  //enemy spawn rate in seconds
  double spawnRate = 3.0;
  //enemy speed
  double enemySpeed = 100.0;

  @override
  void update(double dt) {
    super.update(dt);

    spawnRate -= dt;
    if (spawnRate <= 0) {
      spawnRate = 3.0;
      final enemy = Enemy();
      gameRef.add(enemy);
    }
  }
}


