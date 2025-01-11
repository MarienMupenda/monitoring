# Nom du projet (utile pour la lisibilité)
PROJECT_NAME=monitoring-stack

# Commande Docker Compose (plus moderne)
DOCKER_COMPOSE=docker compose

# Commande pour démarrer la stack
start:
	$(DOCKER_COMPOSE) up -d

# Commande pour arrêter la stack
stop:
	$(DOCKER_COMPOSE) down

# Commande pour redémarrer la stack
restart: stop start

# Afficher les logs de tous les services (en continu)
logs:
	$(DOCKER_COMPOSE) logs -f

# Vérifier l'état des conteneurs en cours d'exécution
status:
	docker ps

# Nettoyage complet (conteneurs, volumes, etc.)
clean:
	$(DOCKER_COMPOSE) down -v

# Mettre à jour les images et redémarrer
update:
	$(DOCKER_COMPOSE) pull
	$(DOCKER_COMPOSE) up -d --build

# Vérification des services accessibles
test:
	@echo "Prometheus : http://localhost:9090"
	@echo "Grafana : http://localhost:3000"
	@echo "cAdvisor : http://localhost:8080"

# Aide pour lister les commandes disponibles
help:
	@echo "Commandes disponibles :"
	@echo "  make start     - Démarrer les services"
	@echo "  make stop      - Arrête
