import 'package:flutter/material.dart';

class MockSSOPage extends StatelessWidget {
  const MockSSOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// MOCK SSO label
              const Text(
                "MOCK SSO",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.5,
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                ),
              ),

              const SizedBox(height: 16),

              /// Title
              const Text(
                "シングルサインオン（デモ）",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),

              const SizedBox(height: 16),

              /// Description
              const Text(
                "本番環境では認証プロバイダへリダイレクトされます。この画面は接続確認用のモックです。",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                ),
              ),

              const SizedBox(height: 28),

              /// Login Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("Login clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19B6C9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "ログイン",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}