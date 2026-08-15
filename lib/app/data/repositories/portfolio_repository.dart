import '../models/project_model.dart';
import '../models/education_model.dart';
import '../models/tech_stack_model.dart';
import '../models/certificate_model.dart';

class PortfolioRepository {
  List<ProjectModel> getProjects() {
    return [
      ProjectModel(
        id: '1',
        name: 'Point Of Sales',
        description:
            'Aplikasi Kasir dengan fitur lengkap untuk Android. Memiliki sistem autentikasi, cart, scan barcode produk, notifikasi push dan integrasi Algoritma Naive Bayes.',
        imageUrl: 'assets/images/profile.jpeg',
        techStack: ['Flutter', 'Firebase', 'GetX', 'One Signal', 'Cloudinary'],
        demoUrl: 'https://drive.google.com/your-demo-link-1',
        codeUrl: 'https://github.com/yourusername/ecommerce-app',
        category: 'Mobile Development',
      ),
      ProjectModel(
        id: '2',
        name: 'Chat Application',
        description:
            'Real-time chat application dengan fitur group chat, multimedia sharing, dan push notifications.',
        imageUrl: 'assets/images/profile.jpeg',
        techStack: ['Flutter', 'Socket.io', 'Node.js', 'MongoDB'],
        demoUrl: 'https://drive.google.com/your-demo-link-2',
        codeUrl: 'https://github.com/yourusername/chat-app',
        category: 'Mobile Development',
      ),
      ProjectModel(
        id: '3',
        name: 'Task Management',
        description:
            'Aplikasi manajemen task dengan fitur kolaborasi tim, reminder, dan analytics dashboard.',
        imageUrl: 'assets/images/profile.jpeg',
        techStack: ['Flutter', 'GetX', 'SQLite', 'Material Design'],
        demoUrl: 'https://drive.google.com/your-demo-link-3',
        codeUrl: 'https://github.com/yourusername/task-management',
        category: 'Mobile Development',
      ),
    ];
  }

  List<EducationModel> getEducation() {
    return [
      EducationModel(
        degree: 'S1 Rekayasa Perangkat Lunak',
        institution: 'Universitas Dipa Makassar',
        period: '2022 - 2026',
        description: 'Fokus pada mobile development dan software engineering',
      ),
    ];
  }

  List<TechStackModel> getTechStack() {
    return [
      // Frontend
      TechStackModel(name: 'Flutter', category: 'Frontend'),
      TechStackModel(name: 'Dart', category: 'Frontend'),
      TechStackModel(name: 'Android SDK', category: 'Frontend'),
      TechStackModel(name: 'GetX', category: 'Frontend'),

      // Backend
      TechStackModel(name: 'Firebase', category: 'Backend'),
      TechStackModel(name: 'Node.js', category: 'Backend'),
      TechStackModel(name: 'REST API', category: 'Backend'),
      TechStackModel(name: 'MySQL', category: 'Backend'),
      TechStackModel(name: 'OneSignal', category: 'Backend'),
      TechStackModel(name: 'Cloudinary', category: 'Backend'),

      // Tools
      TechStackModel(name: 'Github', category: 'Tools'),
      TechStackModel(name: 'Figma', category: 'Tools'),
      TechStackModel(name: 'VS Code', category: 'Tools'),
      TechStackModel(name: 'Opencode', category: 'Tools'),
    ];
  }

  Map<String, String> getContactInfo() {
    return {
      'email': 'raihanraihan522@gmail.com',
      'phone': '+62 851 1708 0730',
      'linkedin': 'https://linkedin.com/in/yourprofile',
      'github': 'https://github.com/yourusername',
    };
  }

  Map<String, String> getAboutMe() {
    return {
      'name': 'M RAYHAN CAESAR AGUNG',
      'title': 'Android Developer',
      'description':
          'Saya merupakan lulusan baru dari Universitas Dipa Makassar, selama masa perkuliahan saya sudah beberapa kali membangun sebuah project aplikasi berbasis mobile khusus nya Android. Saya juga Passionate dalam menciptakan aplikasi yang user-friendly dan juga performance.',
      'image': 'assets/images/profile.jpeg',
    };
  }

  List<CertificateModel> getCertificates() {
    return [
      CertificateModel(
        name: 'Associate Data Scientist',
        imageUrl: 'assets/images/associate_data_scientist.png',
        pdfUrl:
            'assets/certificates/Sertifikat_M. RAYHAN CAESAR AGUNG_Associate Data Scientist.pdf',
      ),
      CertificateModel(
        name: 'Pemasaran Digital Dengan Kecerdasan Buatan (AI) Untuk Wirausaha',
        imageUrl: 'assets/images/sertifikat_pemasaran_digital.png',
        pdfUrl:
            'assets/certificates/Sertifikat_M. RAYHAN CAESAR AGUNG_Pemasaran Digital Dengan Kecerdasan Buatan (AI) Untuk Wirausaha.pdf',
      ),
      CertificateModel(
        name:
            'Pengantar Mindset Digital 1: Mengubah Masa Depan Anda Dengan Pola Pikir Digital',
        imageUrl: 'assets/images/pengantar_mindset_sertifikat.png',
        pdfUrl:
            'assets/certificates/Sertifikat_M. RAYHAN CAESAR AGUNG_Pengantar Mindset Digital 1 _ Mengubah Masa Depan Anda Dengan Pola Pikir Digital.pdf',
      ),
      CertificateModel(
        name: 'Pemanfaatan Aplikasi Chat Bagi Wirausahawan Pemula',
        imageUrl: 'assets/images/Pemanfaatan_aplikasi_chat_bagi_wirausaha.png',
        pdfUrl:
            'assets/certificates/Sertifikat_M. RAYHAN CAESAR AGUNG_Pemanfaatan Aplikasi Chat Bagi Wirausahawan Pemula.pdf',
      ),
    ];
  }
}
