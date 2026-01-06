import 'package:url_launcher/url_launcher.dart';

/// ===============================
/// WHATSAPP
/// ===============================
Future<void> openWhatsApp() async {
  const String message =
      "Halo, saya tertarik membuat website 🌐. Bisa kita diskusikan?";

  final Uri url = Uri.parse(
    "https://wa.me/6283818908892?text=${Uri.encodeComponent(message)}",
  );

  await _launch(url);
}

/// ===============================
/// INSTAGRAM
/// ===============================
Future<void> openInstagram() async {
  final Uri url = Uri.parse("https://www.instagram.com/_kai.butsu");

  await _launch(url);
}

/// ===============================
/// GITHUB
/// ===============================
Future<void> openGitHub() async {
  final Uri url = Uri.parse("https://github.com/Almubarok044");

  await _launch(url);
}

/// ===============================
/// LINKEDIN
/// ===============================
Future<void> openLinkedIn() async {
  final Uri url = Uri.parse(
    "https://www.linkedin.com/in/mohamad-almubarok-107259284",
  );

  await _launch(url);
}

/// ===============================
/// COMMON LAUNCHER (PRIVATE)
/// ===============================
Future<void> _launch(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception("Tidak dapat membuka ${url.toString()}");
  }
}
