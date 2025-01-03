
import 'package:aaroha/components/app_bar.dart';
import 'package:aaroha/pages/LoginPage.dart';
import 'package:aaroha/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:aaroha/HomePage.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isEmailVerified = false;
  bool canResendEmail = true;

  @override
  void initState() {
    super.initState();
    checkEmailVerified();
  }

  Future checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload(); // Reload user data
    setState(() {
      isEmailVerified = user?.emailVerified ?? false;
    });

    if (isEmailVerified) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
    if (!isEmailVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email not verified. Please check your inbox.'),
        ),
      );
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Verification email sent. Please check your inbox.",
          style: TextStyle(fontSize: 18.0),
        ),
      ));

      await Future.delayed(const Duration(seconds: 30));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Failed to send verification email. Try again later.",
          style: TextStyle(fontSize: 18.0),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(90),
        child: CustomAppBar(
          title: "Email Verification",
          titleTheme: Theme.of(context).textTheme.titleLarge,
          iconColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Center(
        child: isEmailVerified
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "A verification email has been sent to your email address.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: canResendEmail ? sendVerificationEmail : null,
              child: const Text("Resend Email"),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => checkEmailVerified(),
              child: const Text("I've Verified"),
            ),
          ],
        ),
      ),
    );
  }
}
