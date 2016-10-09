update-prelude:
	git remote | grep upstream || \
	  git remote add upstream https://github.com/bbatsov/prelude.git
	git pull upstream master

commit-user-config:
	git add personal
	git commit -m "Updated personalization"

push-user-config:
	git push origin
