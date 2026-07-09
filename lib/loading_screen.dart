import 'package:flutter/material.dart';
import 'dart:async';

class LoadingScreen extends StatefulWidget {
  final String loadingText;
  final Duration duration;
  final VoidCallback? onComplete;

  const LoadingScreen({
    Key? key,
    this.loadingText = "Loading...",
    this.duration = const Duration(seconds: 3),
    this.onComplete,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _beeAnimationController;
  late AnimationController _progressAnimationController;
  late Animation<double> _beeScaleAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    // Bee animation controller (for scaling)
    _beeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Progress animation controller
    _progressAnimationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Bee scale animation (breathing effect)
    _beeScaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _beeAnimationController,
      curve: Curves.easeInOut,
    ));

    // Progress animation
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressAnimationController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _startAnimations();
  }

  void _startAnimations() {
    // Start bee breathing animation (repeating)
    _beeAnimationController.repeat(reverse: true);

    // Start progress animation
    _progressAnimationController.forward();

    // Complete loading after duration
    Timer(widget.duration, () {
      if (widget.onComplete != null) {
        widget.onComplete!();
      }
    });
  }

  @override
  void dispose() {
    _beeAnimationController.dispose();
    _progressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFC300), // Bright yellow
              Color.fromARGB(255, 255, 233, 117), // Gold
              Color.fromARGB(255, 255, 195, 0), // Orange
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer to push content to center
              const Spacer(flex: 2),

              // Animated Bee
              AnimatedBuilder(
                animation: _beeScaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _beeScaleAnimation.value,
                    child: Container(
                      width: screenSize.width * 0.5,
                      height: screenSize.width * 0.5,
                      child: Image.asset(
                          "lib/assets/images/budgeting bee pose 2 1.png"),
                    ),
                  );
                },
              ),

              const Spacer(flex: 1),

              // Loading text
              Text(
                widget.loadingText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: screenSize.height * 0.03),

              // Progress bar
              Container(
                width: screenSize.width * 0.8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AnimatedBuilder(
                  animation: _progressAnimation,
                  builder: (context, child) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width:
                            (screenSize.width * 0.8) * _progressAnimation.value,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

// Example usage widget
class LoadingScreenExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(
        loadingText: "Loading Quiz...",
        duration: const Duration(seconds: 4),
        onComplete: () {
          // Navigate to next screen or show completion
          print("Loading completed!");
        },
      ),
    );
  }
}
