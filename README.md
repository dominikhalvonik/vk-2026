# vk-2026

## Docker CLI - Kompletný zoznam príkazov s vysvetlením

### 1. Vytvorenie Docker image

Vytvorenie Docker image s názvom `vk-apache` na základe Dockerfile uloženého ako `config/Dockerfile-apache`.  
Bodka na konci znamená, že sa build vykonáva v aktuálnom priečinku (kontext).

```bash
docker build -t vk-apache -f config/Dockerfile-apache .
```

---

### 2. Spustenie kontajnera

Spustenie kontajnera z image `vk-apache`, kde je vnútorný port kontajnera `80` presmerovaný na port `8080` hostiteľského počítača.  
Parameter `-d` znamená "detached" mód (kontajner beží na pozadí).

```bash
docker run -d -p 8080:80 vk-apache
```

---

### 3. Interaktívne spustenie kontajnera

Spustenie kontajnera s pripojením do interaktívnej konzoly (`/bin/bash`) bez vykonania príkazu CMD alebo ENTRYPOINT (napr. apache2-foreground).  
Parametre `-it` znamenajú interaktívny mód s terminálom.

```bash
docker run -it -p 8080:80 vk-apache /bin/bash
```

---

### 4. Prístup do bežiaceho kontajnera

Pripojenie sa do konzoly existujúceho bežiaceho kontajnera (napríklad `trusting_shamir`).

```bash
docker exec -it trusting_shamir /bin/bash
```

---

### 5. Zobrazenie zoznamu kontajnerov

Zobrazenie všetkých bežiacich kontajnerov.

```bash
docker ps
```

Zobrazenie všetkých kontajnerov, aj tých, ktoré sú zastavené.

```bash
docker ps -a
```

---

### 6. Zastavenie a vymazanie kontajnera

Zastavenie bežiaceho kontajnera s názvom `trusting_shamir`.

```bash
docker stop trusting_shamir
```

Vymazanie kontajnera s názvom `trusting_shamir`.

```bash
docker rm trusting_shamir
```

---

### 7. Zobrazenie dostupných Docker images

Zobrazenie všetkých lokálnych images uložených na disku.

```bash
docker images
```

---

### 8. Práca s volume (perzistentné dáta)

Vytvorenie volume s názvom `mydata`.

```bash
docker volume create mydata
```

Spustenie kontajnera s pripojenou volume `mydata`, ktorá bude namapovaná do priečinka `/var/www/html/data` v kontajneri.

```bash
docker run -d -p 8080:80 -v mydata:/var/www/html/data vk-apache
```

Zobrazenie zoznamu všetkých volume.

```bash
docker volume ls
```

Detailné informácie o konkrétnej volume `mydata`.

```bash
docker volume inspect mydata
```

Vymazanie volume `mydata`.

```bash
docker volume rm mydata
```

---

### 9. Práca s logmi kontajnera

Zobrazenie všetkých logov kontajnera `trusting_shamir`.

```bash
docker logs trusting_shamir
```

Sledovanie logov kontajnera `trusting_shamir` v reálnom čase (priebežne).

```bash
docker logs -f trusting_shamir
```

---

### 10. Práca so sieťami

Vytvorenie izolovanej siete `mynetwork`.

```bash
docker network create mynetwork
```

Spustenie kontajnera `web`, ktorý bude pripojený k sieti `mynetwork`.

```bash
docker run -d --network=mynetwork --name web vk-apache
```

Zobrazenie zoznamu všetkých sietí.

```bash
docker network ls
```

Detailné informácie o konkrétnej sieti `mynetwork`.

```bash
docker network inspect mynetwork
```

Vymazanie siete `mynetwork`.

```bash
docker network rm mynetwork
```

---

### 11. Export a import Docker image

Export image `vk-apache` do súboru `vk-apache.tar`.

```bash
docker save vk-apache > vk-apache.tar
```

Import image zo súboru `vk-apache.tar`.

```bash
docker load < vk-apache.tar
```

---

## Záver Docker CLI

Tento zoznam zahŕňa základné aj pokročilejšie príkazy, ktoré potrebujeme pri práci s Dockerom — od vytvárania image a kontajnerov, až po správu volume, sietí a logov.