# Installation et configuration OpenLDAP

	Installation et configuration complete de OpenLDAP pour debian 9 (stretch)

## Installation

	apt update
	apt install ldap-utils slapd

## Configuration

### Creation de la base

	vim /etc/ldap/schema.local/newdb.ldif

	dn: olcDatabase=mdb,cn=config 
	objectClass: olcDatabaseConfig 
	objectClass: olcMdbConfig 
	olcDatabase: mdb 
	olcDbDirectory: /srv/ldap/iut                     # arborescence de la base 
	olcSuffix: dc=iut,dc=org                          # nom de la base 
	olcRootDN: cn=admin,dc=iut,dc=org                 # admin de la base 
	olcRootPW: {SSHA}0PgjlQLHSsC9dZ6Z4UVdB6iIzsDUMjl9 # generation du mdp avec slappasswd

	mkdir -p /srv/ldap/iut                            # creation de l'arborescence

	chown openldap /srv/ldap/iut                      # on donne les droits a openldap d'ecrire dans son dossier

	ldapadd -Y EXTERNAL -H ldapi:/// -f newdb.ldif    # creation de la base

### Creation de l'objet racine

	vim /etc/ldap/schma.local/newdbroot.ldif

	dn: dc=iut,dc=org
	ObjectClass: dcObject
	ObjectClass: organization
	dc: iut
	o: iut.org

	ldapadd -x -H ldapi:/// -D cn=admin,dc=iut,dc=org -f newdbroot.ldif -W

### Creation des categories

	vim /etc/ldap/schema.local/departement.ldif

	dn: ou=dut,dc=iut,dc=org
	ObjectClass: organizationalUnit
	ou: dut
	description: Diplome Universitaire Technologique

	dn: ou=lp,dc=iut,dc=org
	ObjectClass: organizationalUnit
	ou: lp
	description: Licence Professionnel

	dn: ou=master,dc=iut,dc=org
	ObjectClass: organizationalUnit
	ou: master
	description: master


	ldapadd -x -H ldapi:/// -D cn=admin,dc=iut,dc=org -f departement.ldif -W

### Creation des utilisateurs

	vim /etc/ldap/schema.local/inetorgperson.ldif

	dn: cn=Clement Dusart,ou=lp,dc=iut,dc=org
	ObjectClass: inetOrgPerson
	cn: Clement Dusart
	sn: dusartc
	displayName: dusartc
	title: Etudiant
	businessCategory: Informatique
	uid: dusartc
	ou: lp

	dn: cn=Jean Kevin,ou=dut,dc=iut,dc=org
	ObjectClass: inetOrgPerson
	cn: Jean Kevin
	sn: JeanKev
	displayName: kevinj
	title: Etudiant
	businessCategory: Genie Biologie
	uid: kevinj
	ou: dut

	...

	les formations sont indiqués dans l'OU de l'utilisateur, son département est indiqué dans l'attribut businessCategory et sa catégorie personnelle est indiquée dans l'attribut title

#### script pour creer un utilisateur

	...

## Recherche

### personels du département Informatique

	ldapsearch -Y EXTERNAL -H ldapi:/// -b dc=iut,dc=org '(businessCategory=Informatique)'

### etudiants en DUT bio
	
	ldapsearch -Y EXTERNAL -H ldapi:/// -b ou=dut,dc=iut,dc=org '(&(title=Etudiant)(businessCategory=Genie Biologie))'
