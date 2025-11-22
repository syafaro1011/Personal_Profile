import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/profile.dart';
import '../widgets/info_card.dart';
import '../widgets/skill_item.dart';
import '../widgets/hobby_item.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool isDarkMode = false;

  // Data profil mahasiswa
  final Profile myProfile = Profile(
    nama: 'Syaiful Fathur Rozaq',
    nim: '23552011282',
    jurusan: 'Teknik Informatika',
    email: 'syaifulfathurrozaq@gmail.com',
    telepon: '+62 888-6056-098',
    foto: 'images/profile.jpg',
    status: StatusMahasiswa.aktif,
    hobi: [
      'Coding',
      'Gaming',
      'Membaca',
      'Musik',
    ],
    skill: [
      Skill(nama: 'Java', level: 3, icon: '☕'),
      Skill(nama: 'Flutter', level: 3, icon: '📱'),
      Skill(nama: 'Dart', level: 3, icon: '🎯'),
      Skill(nama: 'Python', level: 3, icon: '🐍'),
      Skill(nama: 'UI/UX', level: 2, icon: '🎨'),
      Skill(nama: 'Git', level: 4, icon: '📦'),
      Skill(nama: 'IoT', level: 4, icon: '💡'),
      Skill(nama: 'AI', level: 2, icon: '🤖'),
    ],
  );

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  ThemeData getTheme() {
    if (isDarkMode) {
      return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
          surface: const Color(0xFF1E1E1E),
          background: const Color(0xFF121212),
        ),
      );
    } else {
      return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[50],
        cardColor: Colors.white,
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
          surface: Colors.white,
          background: Colors.grey[50]!,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: getTheme(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _buildAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildProfileHeader(),
                  _buildInfoSection(),
                  _buildHobbySection(),
                  _buildSkillSection(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      backgroundColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.blue,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: isDarkMode 
                ? Colors.white.withOpacity(0.1) 
                : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: toggleTheme,
            tooltip: isDarkMode ? 'Mode Terang' : 'Mode Gelap',
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Personal Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDarkMode
                      ? [
                          const Color(0xFF1E1E1E),
                          const Color(0xFF2C2C2C),
                        ]
                      : [
                          Colors.blue,
                          Colors.blue.withOpacity(0.7),
                        ],
                ),
              ),
            ),
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              left: -30,
              bottom: -30,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blueAccent,
                    ],
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: isDarkMode 
                      ? const Color(0xFF1E1E1E) 
                      : Colors.white,
                  child: myProfile.foto.isEmpty
                      ? Icon(
                          Icons.person,
                          size: 60,
                          color: isDarkMode ? Colors.white54 : Colors.grey,
                        )
                      : ClipOval(
                          child: Image.asset(
                            myProfile.foto,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.person,
                                size: 60,
                                color: isDarkMode ? Colors.white54 : Colors.grey,
                              );
                            },
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: myProfile.status == StatusMahasiswa.aktif
                        ? Colors.green
                        : Colors.orange,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDarkMode 
                          ? const Color(0xFF121212) 
                          : Colors.grey[50]!,
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            myProfile.nama,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.blue.withOpacity(0.3),
              ),
            ),
            child: Text(
              myProfile.getStatusText(),
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi Pribadi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          InfoCard(
            icon: FontAwesomeIcons.idCard,
            title: 'NIM',
            content: myProfile.nim,
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 12),
          InfoCard(
            icon: FontAwesomeIcons.graduationCap,
            title: 'Jurusan',
            content: myProfile.jurusan,
            iconColor: Colors.purple,
          ),
          const SizedBox(height: 12),
          InfoCard(
            icon: FontAwesomeIcons.envelope,
            title: 'Email',
            content: myProfile.email,
            iconColor: Colors.red,
          ),
          const SizedBox(height: 12),
          InfoCard(
            icon: FontAwesomeIcons.phone,
            title: 'Telepon',
            content: myProfile.telepon,
            iconColor: Colors.green,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHobbySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hobi & Minat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${myProfile.getTotalHobi()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myProfile.hobi.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: HobbyItem(
                    hobby: myProfile.hobi[index],
                    index: index,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSkillSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Keahlian',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${myProfile.getTotalSkill()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: myProfile.skill.length,
            itemBuilder: (context, index) {
              return SkillItem(skill: myProfile.skill[index]);
            },
          ),
        ],
      ),
    );
  }
}