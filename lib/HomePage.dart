import 'package:flutter/material.dart';
import 'Buyer/govipola_marketplace.dart';
import 'Farmer/farmerDashboard.dart';
import 'Login and signup/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        // ✅ BACK BUTTON
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1B5E20),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF1F8E9),
              Color(0xFFDCEDC8),
              Colors.white,
            ],
          ),
        ),

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                  'GoviPola',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E20),
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Choose your journey',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E7D32),
                  ),
                ),

                const SizedBox(height: 40),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? screenWidth * 0.15 : 20,
                  ),
                  child: const Text(
                    'Join our community to connect directly with the source of your food or\nreach new customers for your harvest.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF424242),
                      height: 1.6,
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                isLargeScreen
                    ? _buildHorizontalLayout(context)
                    : _buildVerticalLayout(context),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= LAYOUTS =================

  Widget _buildVerticalLayout(BuildContext context) {
    return Column(
      children: [
        _buildRoleOption(
          title: 'Buyer',
          description:
          'Browse fresh local produce, connect directly with\nfarmers in your area, and manage your orders easily.',
          buttonText: 'Continue as Buyer',
          icon: Icons.storefront,
          color: const Color(0xFF4CAF50),
          onPressed: () => _navigateToBuyer(context),
        ),

        const SizedBox(height: 40),
        _buildOrDivider(),
        const SizedBox(height: 40),

        _buildRoleOption(
          title: 'Farmer',
          description:
          'List your harvest, manage inventory in real-time,\nand reach buyers without middlemen.',
          buttonText: 'Continue as Farmer',
          icon: Icons.agriculture,
          color: const Color(0xFFF57C00),
          onPressed: () => _navigateToFarmer(context),
        ),
      ],
    );
  }

  Widget _buildHorizontalLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildRoleOption(
            title: 'Buyer',
            description:
            'Browse fresh produce, connect with farmers,\nand manage orders easily.',
            buttonText: 'Continue as Buyer',
            icon: Icons.storefront,
            color: const Color(0xFF4CAF50),
            onPressed: () => _navigateToBuyer(context),
          ),
        ),

        const SizedBox(width: 40),

        Column(
          children: [
            const SizedBox(height: 100),
            _buildVerticalOrDivider(),
          ],
        ),

        const SizedBox(width: 40),

        Expanded(
          child: _buildRoleOption(
            title: 'Farmer',
            description:
            'Sell your harvest, manage inventory,\nand reach more buyers.',
            buttonText: 'Continue as Farmer',
            icon: Icons.agriculture,
            color: const Color(0xFFF57C00),
            onPressed: () => _navigateToFarmer(context),
          ),
        ),
      ],
    );
  }

  // ================= UI COMPONENTS =================

  Widget _buildRoleOption({
    required String title,
    required String description,
    required String buttonText,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 40, color: color),
            ),

            const SizedBox(height: 25),

            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF555555),
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white, // ✅ TEXT COLOR WHITE
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[400])),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text('OR'),
        ),
        Expanded(child: Divider(color: Colors.grey[400])),
      ],
    );
  }

  Widget _buildVerticalOrDivider() {
    return Column(
      children: [
        Container(width: 1, height: 50, color: Colors.grey[400]),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('OR'),
        ),
        Container(width: 1, height: 50, color: Colors.grey[400]),
      ],
    );
  }

  // ================= NAVIGATION =================

  void _navigateToBuyer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GoviPolaMarketplace(),
      ),
    );
  }

  void _navigateToFarmer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FarmerDashboard(),
      ),
    );
  }
}
