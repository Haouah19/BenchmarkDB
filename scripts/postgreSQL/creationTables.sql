-- Table Definition ----------------------------------------------

CREATE TABLE "Connexion" (
    "connexionID" integer PRIMARY KEY,
    login text NOT NULL UNIQUE,
    password text NOT NULL
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "Connexion_pkey" ON "Connexion"("connexionID" int4_ops);
CREATE UNIQUE INDEX "Connexion_login_key" ON "Connexion"(login text_ops);

-- Table Definition ----------------------------------------------

CREATE TABLE "Etudiant" (
    "etudiantID" integer PRIMARY KEY REFERENCES "Connexion"("connexionID") ON DELETE CASCADE ON UPDATE CASCADE,
    "nomEtu" text NOT NULL,
    "prenomEtu" text NOT NULL,
    "adresseEtu" text,
    "emailEtu" text NOT NULL,
    "numeroTelEtu" text NOT NULL,
    "tuteurID" integer REFERENCES "Tuteur"("tuteurID"),
    "enseignantID" integer REFERENCES "Enseignant"("enseignantID"),
    "formationID" integer NOT NULL
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "Etudiant_pkey" ON "Etudiant"("etudiantID" int4_ops);

-- Table Definition ----------------------------------------------

CREATE TABLE "Enseignant" (
    "enseignantID" integer PRIMARY KEY REFERENCES "Connexion"("connexionID") ON DELETE CASCADE ON UPDATE CASCADE,
    "nomEn" text NOT NULL,
    "prenomEn" text NOT NULL,
    "adresseEn" text,
    "emailEn" text NOT NULL,
    "numeroTelEn" text NOT NULL
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "Enseignant_pkey" ON "Enseignant"("enseignantID" int4_ops);

-- Table Definition ----------------------------------------------

CREATE TABLE "Tuteur" (
    "tuteurID" integer PRIMARY KEY REFERENCES "Connexion"("connexionID") ON DELETE CASCADE ON UPDATE CASCADE,
    "nomTu" text NOT NULL,
    "prenomTu" text NOT NULL,
    "adresseTu" text,
    "emailTu" text NOT NULL,
    "numeroTelTu" text NOT NULL
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "Tuteur_pkey" ON "Tuteur"("tuteurID" int4_ops);

-- Table Definition ----------------------------------------------

CREATE TABLE "Univesite" (
    "universiteID" integer PRIMARY KEY,
    nom text NOT NULL,
    adresse text NOT NULL,
    "recteurID" integer REFERENCES "Enseignant"("enseignantID")
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "Univesite_pkey" ON "Univesite"("universiteID" int4_ops);


-- Table Definition ----------------------------------------------

CREATE TABLE "Document" (
    "documentID" integer PRIMARY KEY,
    "auteurID" integer NOT NULL REFERENCES "Connexion"("connexionID") ON DELETE CASCADE ON UPDATE CASCADE,
    "lienFichier" text NOT NULL,
    description text NOT NULL,
    date date NOT NULL,
    heure time without time zone NOT NULL
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "Document_pkey" ON "Document"("documentID" int4_ops);

-- Table Definition ----------------------------------------------

CREATE TABLE "DocEchange" (
    "documentID" integer PRIMARY KEY REFERENCES "Document"("documentID") ON DELETE CASCADE ON UPDATE CASCADE,
    droits integer[] NOT NULL,
    "notificationMail" boolean,
    "ajouterLivret" boolean
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "DocEchange_pkey" ON "DocEchange"("documentID" int4_ops);

-- Table Definition ----------------------------------------------

CREATE TABLE "DocAttestationPresence" (
    "documentID" integer DEFAULT nextval('"DocAttestationPresence_documentID_seq"'::regclass) PRIMARY KEY REFERENCES "Document"("documentID") ON DELETE CASCADE ON UPDATE CASCADE,
    periode text NOT NULL,
    "dureeAbsence" text NOT NULL
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "DocAttestationPresence_pkey" ON "DocAttestationPresence"("documentID" int4_ops);

-- Table Definition ----------------------------------------------

CREATE TABLE "DocAide" (
    "documentID" integer PRIMARY KEY REFERENCES "Document"("documentID") ON DELETE CASCADE ON UPDATE CASCADE,
    "dateMAJ" date
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "DocAide_pkey" ON "DocAide"("documentID" int4_ops);

-- Table Definition ----------------------------------------------

CREATE TABLE "DocUtiles" (
    "documentID" integer PRIMARY KEY REFERENCES "Document"("documentID") ON DELETE CASCADE ON UPDATE CASCADE,
    "autreDes" text
);

-- Indices -------------------------------------------------------

CREATE UNIQUE INDEX "DocUtiles_pkey" ON "DocUtiles"("documentID" int4_ops);


