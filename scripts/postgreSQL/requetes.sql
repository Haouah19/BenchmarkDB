--- Requêtes --- 
-- les étudiants qui ont M. Colazoo comme enseignant référent
Select "nomEtu", "prenomEtu" from "Etudiant","Enseignant" Where "Etudiant"."enseignantID" = "Enseignant"."enseignantID" and "Enseignant"."nomEn" = 'Colazoo'  ;

-- les étudiants qui ont M. Rahmani comme tuteur
Select "nomEtu","prenomEtu", "emailEtu"  from "Etudiant","Tuteur" Where "Etudiant"."tuteurID" = "Tuteur"."tuteurID" and "Tuteur"."nomTu" = 'Rahmani'  ;

--- le reste des requêtes sont similaires, elles suivent la même logique de jointure ---

--- Exemple : si on souhaite récupérer les enseignants d'une formation donné ---
--- 1) On recherche la liste des enseignants pour cette formation depuis la base Document ---
--- {{_id : "3"}, {enseignants : 1}} ---
--- 2) puis avec la liste des enseigants, on fait une requête dans la base SQL ---
--- Select "nomEn", "prenomEns" from "Enseignant" Where "enseignantID" dans la liste récupérée. ---


--- en ce qui concerne les documents, les liens .. ect, les requêtes sont similaires aux premières ---