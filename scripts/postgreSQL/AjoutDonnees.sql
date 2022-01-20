--- Ajout de données ---

---- Connexion ----
CREATE EXTENSION pgcrypto;

INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  1,
  'ahmed.haouili',
  crypt('ahmed', gen_salt('bf'))
);

INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  2,
  'abdelouheb.mouhoubi',
  crypt('abdelouheb', gen_salt('bf'))
);

INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  3,
  'antoine.perrin',
  crypt('antoine', gen_salt('bf'))
);

INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  4,
  'aymeric.roinel',
  crypt('aymeric', gen_salt('bf'))
);

INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  5,
  'imene.bentahar',
  crypt('imene', gen_salt('bf'))
);


INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  7,
  'dario.colazoo',
  crypt('dario', gen_salt('bf'))
);

INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  8,
  'mickael.zam',
  crypt('mickael', gen_salt('bf'))
);


INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  9,
  'abdel.rahmani',
  crypt('abdel', gen_salt('bf'))
);

INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  10,
  'cherifa.attou',
  crypt('cherifa', gen_salt('bf'))
);


INSERT INTO "Connexion" ("connexionID", login, password) VALUES (
  11,
  'xavier.creen',
  crypt('xavier', gen_salt('bf'))
);


--- Enseignant ---

INSERT INTO "public"."Enseignant"("enseignantID", "nomEn", "prenomEn", "emailEn", "numeroTelEn") VALUES(
5, 'Ben Tahar', 'Imène', 'imene.bentahar@dauphine.eu', '+33785067723'
) RETURNING "enseignantID", "nomEn", "prenomEn", "adresseEn", "emailEn", "numeroTelEn";

INSERT INTO "public"."Enseignant"("enseignantID", "nomEn", "prenomEn", "emailEn", "numeroTelEn") VALUES(
7, 'Colazoo', 'Dario', 'colazoo.darioo@dauphine.eu', '+33785067723'
) RETURNING "enseignantID", "nomEn", "prenomEn", "adresseEn", "emailEn", "numeroTelEn";

INSERT INTO "public"."Enseignant"("enseignantID", "nomEn", "prenomEn", "emailEn", "numeroTelEn") VALUES(
8, 'Mickael', 'ZAM', 'mickael.zam@dauphine.eu', '+33785067723'
) RETURNING "enseignantID", "nomEn", "prenomEn", "adresseEn", "emailEn", "numeroTelEn";


--- Tuteur ----
INSERT INTO "public"."Tuteur"("tuteurID", "nomTu", "prenomTu", "emailTu", "numeroTelTu", "nomEntreprise") VALUES(
9, 'Rahmani', 'Abdel', 'abdel.rahmani@sfil.fr', '+33785067723', 'SFIL'
) RETURNING "tuteurID", "nomTu", "prenomTu", "adresseTu", "emailTu", "numeroTelTu","nomEntreprise" ;

INSERT INTO "public"."Tuteur"("tuteurID", "nomTu", "prenomTu", "emailTu", "numeroTelTu", "nomEntreprise") VALUES(
10, 'Chérifa', 'Attou', 'cherifa.attou@exane.fr', '+33785067723', 'Exane'
) RETURNING "tuteurID", "nomTu", "prenomTu", "adresseTu", "emailTu", "numeroTelTu", "nomEntreprise";


--- Etudiant ---
INSERT INTO "public"."Etudiant"("etudiantID","nomEtu","prenomEtu","adresseEtu","emailEtu","numeroTelEtu","tuteurID","enseignantID","formationID")
VALUES
(1,E'Haouili',E'Ahmed',E'3 Rue claude Tillier 75012 Paris',E'ahmed.haouili@dauphine.eu',E'+33785057723',9,5,1),
(2,E'Mouhoubi',E'Abdelouheb',NULL,E'abdelouheb.mouhoubi@dauphine.eu',E'+33785057723',10,7,1),
(4,E'Aymeric',E'Roinel',NULL,E'ahmed.haouili@dauphine.eu',E'+33785057723',9,8,1);


--- Uniersité ---
INSERT INTO "public"."Univesite"("universiteID","nom","adresse","recteurID")
VALUES
(1,'Paris-Dauphine PSL','Place du Maréchal de Lattre de Tassigny, 75016 Paris',NULL);



--- Documents ---
INSERT INTO "public"."Document"("documentID","auteurID","lienFichier","description","date","heure")
VALUES
(1,5,E'RELEVÉ D’ASSIDUITÉ EN FORMATION',E'RELEVÉ D’ASSIDUITÉ EN FORMATION Du 01/03/2021au 12/03/2021', CURRENT_DATE, CURRENT_TIME);

INSERT INTO "public"."DocEchange"("documentID","droits","notificationMail","ajouterLivret")
VALUES
(1, ARRAY[1, 1, 1],FALSE,FALSE);


--- Liens ---

INSERT INTO "public"."Lien"("LienID","linkFichierLogo","description","Link")
VALUES
(1,'~LogoCFA.png','Toutes les infos du CFA Afia sur son site (...en refonte continue !)','https://www.cfa-afia.com/'),
(2,'~LogoLinkedIn.png','La page à suivre pour faire plaisir à notre DG :-) !','https://www.linkedin.com/company/cfa-afia/'),
(3,'~LogoTwitter.png','L’actu du CFA Afia en moins de 280 caractères… suivez notre compte !','https://twitter.com/cfaafia');
