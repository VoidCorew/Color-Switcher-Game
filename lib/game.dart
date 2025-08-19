import 'package:color_switcher_game/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ColorSwitcherGame extends FlameGame with TapCallbacks {
  late Player player;

  ColorSwitcherGame()
    : super(
        camera: CameraComponent.withFixedResolution(width: 600, height: 1000),
      );

  @override
  Color backgroundColor() => Color(0xFF222222);

  @override
  void onMount() {
    super.onMount();
    world.add(player = Player());
    // camera.follow(player);
    // debugMode = true;
    world.add(
      RectangleComponent(position: Vector2(-100, -100), size: Vector2.all(20)),
    );
    world.add(
      RectangleComponent(position: Vector2(-200, 100), size: Vector2.all(20)),
    );
    world.add(
      RectangleComponent(position: Vector2(-300, 100), size: Vector2.all(20)),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    final cameraY = camera.viewfinder.position.y;
    final playerY = player.position;
    camera.viewfinder.position = player.position;
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    player.jump();
  }
}
