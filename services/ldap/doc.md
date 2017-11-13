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

### Creation des departements

	vim /etc/ldap/schema.local/departement.ldif

	dn: ou=informatique,dc=iut,dc=org
	ObjectClass: organizationalUnit
	ou: informatique

	-- etc ... --

	ldapadd -x -H ldapi:/// -D cn=admin,dc=iut,dc=org -f departement.ldif -W

### Hierarchie

	iut
	├── departement
	│   ├── chimie
	│   ├── gb
	│   ├── gea
	│   ├── geii
	│   ├── gmp
	│   ├── informatique
	│   └── mesuresPhysiques
	├── formation
	│   ├── dut
	│   ├── lp
	│   └── master
	└── personnel
	    ├── aitos
	    ├── maitreConf
	    ├── profAgrege
	    ├── profCertifie
	    └── profUniv
