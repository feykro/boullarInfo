class UserDetails {
  String nom;
  String prenom;
  String userUID;
  String classe;
  String email;
  String role;
  String? docId;

  UserDetails({
    required this.nom,
    required this.prenom,
    required this.userUID,
    required this.classe,
    required this.email,
    required this.role,
    this.docId,
  });

  factory UserDetails.fromFBdoc(Map<String, dynamic> json) {
    return UserDetails(
      nom: json["Nom"],
      prenom: "Prenom",
      userUID: "UserUID",
      classe: "Classe",
      email: "EmailAddress",
      role: "Role",
    );
  }
}
