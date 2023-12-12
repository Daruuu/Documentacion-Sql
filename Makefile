#script to automate my respository update with MAKRFILE
#phony evita conflictos con archivos llamados run
.PHONY: run

run:
	@git status
	@git add .
	@read -p "Add the commit message:" COMMITMESSAGE; \
	git commit -m "$$COMMITMESSAGE"
		@read -p "Enter the name of branch (main)" BRANCH; \
	git push origin $$BRANCH
		@echo "<<<<<<<<<<--- REPOSITORY UPDATED SUCCESSFULLY!! --->>>>>>>>>>"
	@git log -n 3
