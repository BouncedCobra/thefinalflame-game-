using Godot;
using System;

public class Player : KinematicBody2D
{
    private Vector2 _motion;
    private float _velcidad = 14000f;
    private float _runVel = 28_000f;
    private float _speed;

    private AnimatedSprite _sprite2D;
    
    public override void _Ready()
    {
        _sprite2D = GetNode<AnimatedSprite>("Fireman");
    }

    public override void _PhysicsProcess(float delta)
    {
        DoMovement(delta);
        LookAtMouse();
    }

    private void DoMovement(float delta)
    {
        _motion = Vector2.Zero;

        if (Input.IsActionPressed("move_right"))
        {
            _motion.x = 100f;
            _sprite2D.SetDeferred("animation", "Run");
            _sprite2D.FlipH = false;
        }
        else if (Input.IsActionPressed("move_left"))
        {
            _motion.x = -100f;
            _sprite2D.SetDeferred("animation", "Run");
            _sprite2D.FlipH = true;
        }
        else
        {
            _sprite2D.SetDeferred("animation", "Idle");
        }

        _motion = _motion.Normalized();

        if (Input.IsActionPressed("Run"))
        {
            _speed = _runVel;
        }
        else
        {
            _speed = _velcidad;
        }

        _motion = MoveAndSlide(_motion * _speed * delta);
    }

    private void LookAtMouse()
    {
        var mousePos = GetGlobalMousePosition();

        GetNode<Node2D>("Pivot").LookAt(mousePos);
    }
}


