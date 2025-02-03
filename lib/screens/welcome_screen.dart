import 'package:flutter/material.dart';
import 'package:treatboxrefurbisshed/screens/login_screen.dart';
import 'package:treatboxrefurbisshed/screens/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  bool isLoginHovered = false;
  bool isRegisterHovered = false;

  late AnimationController _fadeController;
  late AnimationController _floatController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );

    _floatController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    _floatAnimation = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedImage() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: AnimatedBuilder(
        animation: _floatAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _floatAnimation.value),
            child: child,
          );
        },
        child: Hero(
          tag: 'welcome_image',
          child: Image.asset(
            'assets/images/welcome1.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(226, 218, 208, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: _buildAnimatedImage(),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome to TreatBox',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Exo2',
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'From delicious cookies to rich chocolates,\n'
                    'We\'ve got the treats you crave.\n'
                    'Order now and enjoy premium snacks,\n'
                    'Delivered right to your doorstep.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Column(
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => isLoginHovered = true),
                      onExit: (_) => setState(() => isLoginHovered = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: Matrix4.translationValues(0, isLoginHovered ? -2 : 0, 0),
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: isLoginHovered ? Colors.black : Colors.white,
                            side: const BorderSide(color: Colors.black, width: 1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: isLoginHovered ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      onEnter: (_) => setState(() => isRegisterHovered = true),
                      onExit: (_) => setState(() => isRegisterHovered = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: Matrix4.translationValues(0, isRegisterHovered ? -2 : 0, 0),
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const RegisterScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
