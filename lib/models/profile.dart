enum StatusMahasiswa { aktif, cuti, lulus, nonAktif }

class Profile {
  final String nama;
  final String nim;
  final String jurusan;
  final String email;
  final String telepon;
  final List<String> hobi;
  final List<Skill> skill;
  final StatusMahasiswa status;
  final String foto;

  Profile({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.email,
    required this.telepon,
    required this.hobi,
    required this.skill,
    required this.status,
    required this.foto,
  });

  String getStatusText() {
    switch (status) {
      case StatusMahasiswa.aktif:
        return 'Aktif';
      case StatusMahasiswa.cuti:
        return 'Cuti';
      case StatusMahasiswa.lulus:
        return 'Lulus';
      case StatusMahasiswa.nonAktif:
        return 'Non-Aktif';
    }
  }

  int getTotalHobi() => hobi.length;

  int getTotalSkill() => skill.length;

  List<String> getSkillNames() => skill.map((s) => s.nama).toList();
}

class Skill {
  final String nama;
  final int level; // 1-5
  final String icon;

  Skill({
    required this.nama,
    required this.level,
    required this.icon,
  });

  String getLevelText() {
    if (level >= 4) return 'Expert';
    if (level >= 3) return 'Advanced';
    if (level >= 2) return 'Intermediate';
    return 'Beginner';
  }
}