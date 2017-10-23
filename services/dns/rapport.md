# TP dns

## declaration des zones dans /etc/bind/named.conf.local

	zone "nom de zone" {
		type master
		fichier /var/bind/...
	}

	...

## description des zones dans /var/bind/nomdezone{,.rev}

	nom -> IP
		@	IN	NS	ns1...
		ns1	IN	A	...100
		...
		
			IN	MX	services ( !! adresse A et pas un cname !!)
		
		www	IN	CNAME	services

	IP -> nom
		@	IN	NS	ns1...
		100	IN	PTR	ns1
		...
		
		octets machines

	NS   -> nameserver
	A    -> IPv4
	AAAA -> IPv6	
	PTR  -> reverse
	MX   -> mail

## modif dans /etc/bind/named.conf.options

	forwarder { ip du DNS à qui forward quand on connait pas la zone }
	recursion yes
	allow-recursion {localnets;}

## modif de /etc/resolv.conf
	
	nameserver 192.168.194.100

## commande pour verifier les conf
	
	named-checkconf
	named-checkzone nomdezone fichierdezone
	nslookup

## redemarrage server

	service bind9 restart	

## log pour verifier

	tail -f /var/log/syslog

## reponse aux questions

	iface ens33 inet static
		address 192.168.194.100
		netmask 255.255.255.0
		gateway 192.168.194.2

	dig NS .

	;; ANSWER SECTION:
	.			5	IN	NS	g.root-servers.net.
	.			5	IN	NS	b.root-servers.net.
	.			5	IN	NS	i.root-servers.net.
	.			5	IN	NS	l.root-servers.net.
	.			5	IN	NS	f.root-servers.net.
	.			5	IN	NS	e.root-servers.net.
	.			5	IN	NS	c.root-servers.net.
	.			5	IN	NS	h.root-servers.net.
	.			5	IN	NS	a.root-servers.net.
	.			5	IN	NS	k.root-servers.net.
	.			5	IN	NS	j.root-servers.net.
	.			5	IN	NS	d.root-servers.net.
	.			5	IN	NS	m.root-servers.net.

	dig NS org

	;; ANSWER SECTION:
	org.			5	IN	NS	a2.org.afilias-nst.info.
	org.			5	IN	NS	a0.org.afilias-nst.info.
	org.			5	IN	NS	c0.org.afilias-nst.info.
	org.			5	IN	NS	b2.org.afilias-nst.org.
	org.			5	IN	NS	b0.org.afilias-nst.org.
	org.			5	IN	NS	d0.org.afilias-nst.org.

	dig NS fr

	;; ANSWER SECTION:
	fr.			5	IN	NS	e.ext.nic.fr.
	fr.			5	IN	NS	d.nic.fr.
	fr.			5	IN	NS	g.ext.nic.fr.
	fr.			5	IN	NS	f.ext.nic.fr.
	fr.			5	IN	NS	d.ext.nic.fr.

	dig NS beer

	;; ANSWER SECTION:
	beer.			5	IN	NS	dnsb.nic.beer.
	beer.			5	IN	NS	dnsc.nic.beer.
	beer.			5	IN	NS	dnsa.nic.beer.
	beer.			5	IN	NS	dns1.nic.beer.
	beer.			5	IN	NS	dns4.nic.beer.
	beer.			5	IN	NS	dnsd.nic.beer.
	beer.			5	IN	NS	dns3.nic.beer.
	beer.			5	IN	NS	dns2.nic.beer.

	dig NS ninja

	;; ANSWER SECTION:
	ninja.			5	IN	NS	demand.delta.aridns.net.au.
	ninja.			5	IN	NS	demand.beta.aridns.net.au.
	ninja.			5	IN	NS	demand.gamma.aridns.net.au.
	ninja.			5	IN	NS	demand.alpha.aridns.net.au.

	dig NS pizza

	;; ANSWER SECTION:
	pizza.			5	IN	NS	demand.gamma.aridns.net.au.
	pizza.			5	IN	NS	demand.beta.aridns.net.au.
	pizza.			5	IN	NS	demand.delta.aridns.net.au.
	pizza.			5	IN	NS	demand.alpha.aridns.net.au.

	dig NS frite

	status: NXDOMAIN -> non de domaine inexistant
