import 'package:cv_website/src/models/phone_number.dart';

class Contact {
  final String? email;
  final String? linkedinUrl;
  final String? githubUrl;
  final String? websiteUrl;
  final String? facebookUrl;
  final String? instagramUrl;
  final String? snapchatUrl;
  final String? telegramUrl;
  final String? whatsappUrl;
  final PhoneNumber? phone;

  const Contact({
    this.email,
    this.linkedinUrl,
    this.githubUrl,
    this.websiteUrl,
    this.facebookUrl,
    this.instagramUrl,
    this.snapchatUrl,
    this.telegramUrl,
    this.whatsappUrl,
    this.phone,
  });
}