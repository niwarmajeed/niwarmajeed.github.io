import 'package:cv_website/src/data/articles.dart';
import 'package:cv_website/src/data/certifications.dart';
import 'package:cv_website/src/data/education.dart';
import 'package:cv_website/src/data/experiences.dart';
import 'package:cv_website/src/data/projects.dart';
import 'package:cv_website/src/data/skills.dart';
import 'package:cv_website/src/models/contact.dart';
import 'package:cv_website/src/models/language.dart';
import 'package:cv_website/src/models/linked_in_profile.dart';
import 'package:cv_website/src/models/phone_number.dart';
import 'package:media_source/media_source.dart';

class ResumeData {
  static final profile = LinkedInProfile(
    firstName: 'Niwar',
    lastName: 'Majeed',
    title: 'Mobile Software Engineer',
    subtitle: 'I build exceptional mobile and web applications that solve real-world problems.',
    focusList: [
      'Native-iOS',
      'Flutter',
      'Cross-Platform Mobile Developer',
      'Android Development',
      'UI/UX Design',
    ],
    calendlyUrl: null, 
    about: '''
- I am a Passionate Mobile Engineer, I specialize in designing and developing high-performance mobile applications using Flutter and Dart. I focus on delivering scalable, reliable, and user-centric mobile solutions that align with business objectives and enhance digital experiences.

- I leverage Domain Driven Design (DDD), Modular Architecture, and Reactive Architecture to build robust systems. My approach combines technical precision with a strong sense of collaboration, ensuring every project achieves its maximum potential through teamwork and agile practices.

- Throughout my career, I’ve contributed to projects across various industries, consistently improving performance and maintainability. I take pride in transforming complex requirements into seamless mobile experiences that make a tangible impact.
''',
    profilePicture: ImageAssetMedia(
      assetPath: 'assets/photo.jpg',
      mimeType: 'image/jpeg',
      name: 'photo.jpg',
      size: 484.86.kb,
    ),
    location: 'Kurdistan',
    resume: DocumentNetworkMedia.url(
        'https://drive.google.com/file/d/13sCoWtPGaIY6yKfPP6sORHs8LadhmACd/view?usp=sharing'),
    contact: const Contact(
      email: 'niwarbesfky22@gmail.com',
      linkedinUrl: 'https://www.linkedin.com/in/developer-niwar-4575b7411',
      githubUrl: 'https://github.com/NiwarMajeed95',
      websiteUrl: 'https://niwar-majeed.web.app',
      snapchatUrl: 'https://www.snapchat.com/add/nicolas_420',
      facebookUrl: 'https://www.facebook.com/share/1D2jQwvkQo/',
      instagramUrl: 'https://www.instagram.com/nicolas._069',
      telegramUrl: 'https://t.me/Nicolas69420',
      whatsappUrl: 'https://wa.me/qr/NMBTFNN3MERVG1',
      phone: PhoneNumber(countryCode: '+964', number: '750 897 8481'),
    ),
    experience: Experiences.values,
    education: EducationSchools.values,
    skills: Skills.sections,
    projects: Projects.values,
    certifications: Certifications.values,
    languages: [
      const Language(name: 'Kurdish', proficiency: 'Native'),
      const Language(name: 'Arabic', proficiency: 'Fluent'),
      const Language(name: 'English', proficiency: 'Professional Working Proficiency'),
    ],
    blogs: Articles.values,
  );
}